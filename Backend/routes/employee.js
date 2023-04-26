const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model')
const Employee = require('../models/employee.model')
const Stat = require('../models/stats.model')
const passport = require('passport')
const dateonly = require('mongoose-dateonly')
const Manager = require('../models/manager.model')
const { isLoggedIn, isManager, isAdmin } = require('../middleware')


// protected route: only for manager or admin
router.get('/allemployee', isLoggedIn, isManager, async function(req, res){            // List of all Employee Profiles
    try{
        const employee = await Employee.find({});
        res.status(200).send(employee) ;
    }
    catch(err){
        res.json(err)
    }
});

router.post('/', async (req,res)=>{                 // Create New employee
    try{

        const data = req.body;
        
        // to increment no. of employees which will define employee ID
        // only 1 doc in collection
        var query =  await Stat.findOneAndUpdate({},
            {$inc:{NoOfEmployee:1}},
            {new:true}
        );

        // await Stat.findOneAndUpdate({},
        //     {$push: {
        //     Attendance: {
        //         key: query.NoOfEmployee,
        //         value: 0
        //     }}
        // })
        
        
        data.EmployeeID = query.NoOfEmployee

        // remove password
        // const clone = (({ password, ...rest }) => rest)(data);


        // // const result = await Employee.create(newemployee);

        // const employee = await new Employee(clone);
        // const newEmployee = await Employee.register(employee, data.password);
        // to increment no. of employees in that department
        const managerdata = await Manager.findOne({ManagerID:data.Manager});
        const dept = await Department.findOneAndUpdate({DepartmentID:managerdata.Department},
            {$inc:{NumberOfEmployee:1}},
            {new:true}
            );
            
            data.Project = managerdata.Project;
            data.DepartmantName = dept.DepartmentName;
            const newEmployee = new Employee(data);
            await newEmployee.save();

        res.status(200).json({"success":"true"}) ;
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.patch('/:id', async (req,res)=>{                            // edit employee by id
    try{
        const result = await Employee.findOneAndUpdate({EmployeeID:req.params.id}, req.body);
        res.status(200).send({"success":"true"});
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.get('/:id', async function(req, res){                       // Read Employee Profile from ID
    try{
        const query = await Employee.findOne({EmployeeID:req.params.id}).lean();
        const ans = await Manager.findOne({ManagerID:query.Manager});
        query.ManagerName = ans.ManagerName ;
        query.SalaryToCredit = query.Salary/22*(22-query.AbsentDates.length) ;
        res.status(200).json(query) ;
    }
    catch(err){
        res.status(500).json(err)
    }
});

router.get('/markattendance/:id',  async function(req, res){                          // Mark Attendance of employee with id
    try{
        const ans = await Employee.findOne({EmployeeID:req.params.id}, {AbsentDates:{ $slice: -1 }});    // Get last date in absent array
        const dateToday = new Date();

        // ans.absentDates will contain only last date in absent array
        // .getDate() will return date of month. Delete entry if date at top of array is same as today's date

        if(dateToday.getDate() == ans.AbsentDates[0].getDate())
        {
            await Employee.updateOne({EmployeeID: req.params.id},{$pop:{"AbsentDates":1}})   // remove last date from absent array
            res.status(200).send({"success":"Attendance marked successfully"})
        }
        else
        {
            res.status(200).send({"error":"Already marked attendance for today"})
        }

    }
    catch(err){
        res.status(500).json(err)
    }
});


router.get('/attendance/:id',async (req,res)=>{                              // Get attendance of all employees
    try{
        const ans = await Employee.findOne({EmployeeID:req.params.id}) ;
        if(ans.AbsentDates.length > 0)
        absentdays = ans.AbsentDates.length ;
        else
        absentdays = 0 ;
        totaldays = 0 ;
        if(ans.DateOfJoining.getMonth() == new Date().getMonth() && ans.DateOfJoining.getYear() == new Date().getYear())
        {
            totaldays = new Date().getDate() - ans.DateOfJoining.getDate() + 1;
        }
        else
        {
            totaldays = new Date().getDate() ;
        }
        const presentdays = totaldays - absentdays ;
        res.status(200).send({"present":presentdays, "absent":absentdays, "total":totaldays}) ;
    } catch(err){
        res.status(500).json(err);
    }


});



// ---------------------------------------------------------------------------------


module.exports = router