var async = require('async');
const express = require('express');
const router = express.Router();
const mongoose = require('mongoose')
const Department = require('../models/departments.model')
const Manager = require('../models/manager.model')
const Employee = require('../models/employee.model')
const Attendance = require('../models/attendance.model')
const LeaveApplication = require('../models/leaveApplication.model')
const Stat = require('../models/stats.model')
const cron = require('node-cron')

// Initialization
async function StatInitialize() {
    await Stat.create({});
}
StatInitialize();

async function foo() {
    const arr = await Attendance.findOne({});
    await Attendance.updateMany({}, {$set:{"AbsentPrevMonth":arr.AbsentThisMonth, "AbsentThisMonth":[]}})
}

cron.schedule('1 0 1 * *', function(){   // A trigger set to execute any node function at a given time. Here it is 1st of every month at 00:01
    AttendanceController() ;
});

//CRUD Operations
router.get('/', async(req, res)=>{
    console.log("Default Page") ;
    res.json("Hey Default page") ;
})
router.post('/createEmployee', async (req,res)=>{     // Create New employee
    try{
        const newemployee = new Employee(req.body)
        var query =  await Stat.findOneAndUpdate({},  // to increment no. of employees which will define employee ID // only 1 doc in collection
        {$inc:{NoOfEmployee:1}},
        {new:true});
        newemployee.EmployeeID = query.NoOfEmployee
        const result = await Employee.create(newemployee);
        await Department.findOneAndUpdate({DepartmentID:1},       // to increment no. of employees in that department
        {$inc:{NumberOfEmployee:1}},
        {new:true});
        await Attendance.create({EmployeeID:newemployee.EmployeeID});
        res.send(`${result.EmployeeName} successfully created!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.post('/createManager', async (req,res)=>{    // Create New manager
    try{
        const newmanager = new Manager(req.body)
        var query =  await Stat.findOneAndUpdate({},       // to increment no. of manager which will define manager ID
        {$inc:{NoOfManager:1}},
        {new:true});
        newmanager.ManagerID = query.NoOfManager;
        const result = await Manager.create(newmanager);
        res.send(`${result.ManagerName} successfully created!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.post('/createDepartment', async (req,res)=>{    // Create New department
    try{
        const department = new Department(req.body)
        const result = await Department.create(department);
        res.send(`${result.DepartmentName} successfully created!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;
 
router.post('/createLeaveApplication', async(req, res)=>{     // create New Leave application
    try{
        const newleave = new LeaveApplication(req.body)
        const ans = await Employee.findOne({EmployeeID:newleave.ApplicantEmployeeID})
        newleave.ResponsibleManagerID = ans.Manager
        var query =  await Stat.findOneAndUpdate({},       // to increment no. of employees which will define employee ID
        {$inc:{NoOfApplication:1}},
        {new:true});
        newleave.ApplicationNumber = query.NoOfApplication
        const result = await LeaveApplication.create(newleave);
        res.send(`${result.ApplicationNumber} successfully created!!`)
    }catch(err){
        res.json(err)
    }
});

router.get('/employeeProfile/:id', async function(req, res){   // Read Employee Profile from ID
    try{
        const query = await Employee.findOne({EmployeeID:req.params.id});
        res.json(query) ;
    }
    catch(err){
        res.json(err)
    }
});

router.get('/employeeDepartment/:id', async function(req, res){   // Get Department Name from Employee ID
    try{
        const query = await Employee.findOne({EmployeeID:req.params.id});
        const ans = await Department.findOne({DepartmentID:query.Department}) ;
        res.json(ans) ;
    }
    catch(err){
        res.json(err)
    }
});

router.get('/viewLeaveApplications/:id', async function(req, res){   // All leave appllication of a particular manager
    try{
        const query = await LeaveApplication.find({ResponsibleManagerID:req.params.id});
        res.json(query) ;
    }
    catch(err){
        res.json(err)
    }
});

router.get('/employeeManagerProject/:id', async(req, res)=>{     // Get the Manager and Project on which employee is working on
    try{
        const query = await Employee.findOne({EmployeeID:req.params.id});    // Get the employee document with given employeeID
        const ans = await Manager.findOne({ManagerID:query.Manager});
        res.json(ans);
    }
    catch(err)
    {
        res.json(err) 
    }

});                                                                                                                                                                                                                                                                                                   
router.patch('/actionLeaveApplication/:id/:type', async function(req, res){    // approve / reject application. id is Application ID, type is the operation: reject or approve 
    try{
        const query = await LeaveApplication.findOneAndUpdate({ApplicationNumber:req.params.id}, {ApplicationStatus:req.params.type},{new:true}) ;
        res.json(query)
    }
    catch(err){
    res.json(err)
    }
});
 
router.get('/markAbsent/:id', async (req, res)=>{      // Absent date will be added to employee's absent list
    try{
        Attendance.findOne({EmployeeID:req.params.id}).then((doc)=>{
            doc.AbsentThisMonth.push(Date.now());
            doc.save() ;
        })
        res.json(doc)
    }
    catch(err){
        res.json(err)
    }
});


module.exports = router