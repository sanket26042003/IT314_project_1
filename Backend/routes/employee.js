const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model')
const Employee = require('../models/employee.model')
const Stat = require('../models/stats.model')
const passport = require('passport')
const dateonly = require('mongoose-dateonly')
const cron = require('node-cron')

async function AttendanceController(){
    await Employee.updateMany({},{$push:{"AbsentDates":new Date()}})     // date is added to absent array
}

cron.schedule('0 1 0 * * *', function(){   // A trigger to execute at 00:01 everyday. 
    AttendanceController() ;
});

AttendanceController();

router.get('/', async function(req, res){            // List of all Employee Profiles
    try{
        const employee = await Employee.find({});
        res.send(employee) ;
    }
    catch(err){
        res.json(err)
    }
});

router.post('/create', async (req,res)=>{                 // Create New employee
    try{

        const data = req.body;
        
        // to increment no. of employees which will define employee ID
        // only 1 doc in collection
        var query =  await Stat.findOneAndUpdate({},
            {$inc:{NoOfEmployee:1}},
            {new:true}
        );

        await Stat.findOneAndUpdate({},
            {$push: {
            Attendance: {
                key: query.NoOfEmployee,
                value: 0
            }}
        })
        
        
        data.EmployeeID = query.NoOfEmployee

        // remove password
        const clone = (({ password, ...rest }) => rest)(data);

        // const result = await Employee.create(newemployee);

        const employee = await new Employee(clone);
        const newEmployee = await Employee.register(employee, data.password);

        // to increment no. of employees in that department
        await Department.findOneAndUpdate({DepartmentID:1},
            {$inc:{NumberOfEmployee:1}},
            {new:true}
        );
        
        console.log(newEmployee);

        res.send(`${newEmployee.EmployeeName} successfully created!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.patch('/profile/:id', async (req,res)=>{                            // edit employee by id
    try{
        const result = await Employee.findOneAndUpdate({EmployeeID:req.params.id}, req.body);
        res.send(`${req.body.EmployeeName} successfully updated!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.get('/profile/:id', async function(req, res){                       // Read Employee Profile from ID
    try{
        const query = await Employee.findOne({EmployeeID:req.params.id});
        res.json(query) ;
    }
    catch(err){
        res.json(err)
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
            res.send("Attendance marked successfully")
        }
        else
        {
            res.send("Already marked attendance for today")
        }

    }
    catch(err){
        res.json(err)
    }
});




// ---------------------------------------------------------------------------------


module.exports = router