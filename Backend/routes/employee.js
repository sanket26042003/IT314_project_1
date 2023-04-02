const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model')
const Employee = require('../models/employee.model')
const Stat = require('../models/stats.model')
const passport = require('passport')

router.get('/', async function(req, res){   // List of all Employee Profiles
    try{
        const employee = await Employee.find({});
        res.send(employee) ;
    }
    catch(err){
        res.json(err)
    }
});

router.post('/', async (req,res)=>{     // Create New employee
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

router.patch('/:id', async (req,res)=>{     // edit employee by id
    try{
        // console.log(req.body);
        // console.log(result.body);
        const result = await Employee.findOneAndUpdate({EmployeeID:req.params.id}, req.body);
        res.send(`${req.body.EmployeeName} successfully updated!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.get('/:id', async function(req, res){   // Read Employee Profile from ID
    try{
        const query = await Employee.findOne({EmployeeID:req.params.id});
        res.json(query) ;
    }
    catch(err){
        res.json(err)
    }
});



// ---------------------------------------------------------------------------------


module.exports = router