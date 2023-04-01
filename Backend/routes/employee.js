const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model')
const Employee = require('../models/employee.model')
const Attendance = require('../models/attendance.model')
const Stat = require('../models/stats.model')

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
        console.log(req) ;
        const newemployee = new Employee(req.body)
        var query =  await Stat.findOneAndUpdate({},  // to increment no. of employees which will define employee ID // only 1 doc in collection
        {$inc:{NoOfEmployee:1}},
        {new:true});
        newemployee.EmployeeID = query.NoOfEmployee
        const result = await Employee.create(newemployee);
        // console.log(newemployee.Department);
        await Department.findOneAndUpdate({DepartmentID:1},       // to increment no. of employees in that department
        {$inc:{NumberOfEmployee:1}},
        {new:true});
        await Attendance.create({EmployeeID:newemployee.EmployeeID});
        res.send(`${result.EmployeeName} successfully created!!`)
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