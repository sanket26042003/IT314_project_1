const express = require('express');
const router = express.Router();
const Manager = require('../models/manager.model')
const Employee = require('../models/employee.model')
const Stat = require('../models/stats.model')
const bcrypt = require('bcrypt');
const Department = require('../models/departments.model')
const { isLoggedIn, isManager, isAdmin } = require('../middleware')

router.post('/', isLoggedIn, isAdmin, async (req,res)=>{                                   // Create New manager
    try{
        const newmanager = new Manager(req.body)
        // to increment no. of manager which will define manager ID
        var tmp =  await Stat.findOne({'_id':'64451e19f213a2b7c257d225'});
        var query = await Stat.findOneAndUpdate({'_id':'64451e19f213a2b7c257d225'},{NoOfManager:tmp.NoOfManager+1});
        newmanager.ManagerID = query.NoOfManager;
        const dept = await Department.findOne({DepartmentID:newmanager.Department});
        newmanager.DepartmentName = dept.DepartmentName;
        newmanager.DateOfJoining = Date.now();
        const result = await Manager.create(newmanager);
        res.status(200).json({"success":"true"}) ;
    }catch(err){
        res.status(500).send(err.message)
    }
});

router.patch('/:id', isLoggedIn, isManager, async (req,res)=>{                               // edit manager
    try{
        const result = await Manager.findOneAndUpdate({ManagerID: req.params.id}, req.body);
        res.status(200).send({"success":"true"});
    }catch(err){
        res.status(500).send(err.message)
    }
});

router.get('/:id', isLoggedIn, isManager, async(req, res)=>{                                    // manager profile
    try{
        const ans = await Manager.findOne({ManagerID:req.params.id}).lean();    // Get the manager document with given managerID
        ans.SalaryToCredit = ans.Salary/22*(22-ans.AbsentDates.length) ;
        if(ans == null)
        res.status(500).json(ans);
        else
        res.status(200).json(ans);
    }
    catch(err)
    {
        res.status(500).json(err) 
    }
});

router.get('/employeemanager/:id', isLoggedIn, isManager, async(req, res)=>{   
    try{
        const ans = await Employee.find({Manager:req.params.id});    // Get the employees list under a particular manager
        res.status(200).json(ans);
    }
    catch(err)
    {
        res.status(500).json(err) 
    }
});     


router.get('/markattendance/:id', isLoggedIn, isManager, async function(req, res){                          // Mark Attendance of employee with id
    try{
        const ans = await Manager.findOne({ManagerID:req.params.id}, {AbsentDates:{ $slice: -1 }});    // Get last date in absent array
        const dateToday = new Date();

        // ans.absentDates will contain only last date in absent array
        // .getDate() will return date of month. Delete entry if date at top of array is same as today's date

        if(dateToday.getDate() == ans.AbsentDates[0].getDate())
        {
            await Manager.updateOne({ManagerID: req.params.id},{$pop:{"AbsentDates":1}})   // remove last date from absent array
            res.status(200).send({"success":"Attendance marked successfully"})
        }
        else
        {
            res.status(200).send({"error":"Already marked attendance for today"})
        }

    }
    catch(err){
        res.json(err)
    }
});


router.get('/attendance/:id', isLoggedIn, isManager, async (req,res)=>{                              // Get attendance of all employees
    try{
        const ans = await Manager.findOne({ManagerID:req.params.id}) ;
        if(ans.AbsentDates.length > 0)
            absentdays = ans.AbsentDates.length ;
        else
            absentdays = 0 ;
        totaldays = new Date().getDate() ;


        const presentdays = totaldays - absentdays ;
        res.status(200).status(200).send({"present":presentdays, "absent":absentdays, "total":totaldays}) ;
    } catch(err){
        res.status(500).json(err);
    }


});


module.exports = router