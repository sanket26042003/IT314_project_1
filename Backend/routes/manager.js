const express = require('express');
const router = express.Router();
const Manager = require('../models/manager.model')
const Employee = require('../models/employee.model')
const Stat = require('../models/stats.model')
const bcrypt = require('bcrypt');

router.post('/', async (req,res)=>{                                   // Create New manager
    try{
        const newmanager = new Manager(req.body)
        // to increment no. of manager which will define manager ID
        var query =  await Stat.findOneAndUpdate({},
            {$inc:{NoOfManager:1}},
            {new:true});
        newmanager.ManagerID = query.NoOfManager;
        const result = await Manager.create(newmanager);
        res.send(`${result.ManagerName} successfully created!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
});

router.patch('/:id', async (req,res)=>{                               // edit manager
    try{
        const result = await Manager.findOneAndUpdate({ManagerID: req.params.id}, req.body);
        res.send(`${req.body.ManagerName} successfully updated!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
});

router.get('/:id', async(req, res)=>{                                    // managerprofile
    try{
        const ans = await Manager.findOne({ManagerID:req.params.id});    // Get the manager document with given managerID
        res.status(200).json(ans);
    }
    catch(err)
    {
        res.status(500).json(err) 
    }
});

router.get('/employeemanager/:id', async(req, res)=>{   
    try{
        const ans = await Employee.find({Manager:req.params.id});    // Get the employees list under a particular manager
        res.status(200).json(ans);
    }
    catch(err)
    {
        res.status(500).json(err) 
    }
});     


router.get('/markattendance/:id',  async function(req, res){                          // Mark Attendance of employee with id
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


router.get('/attendance/:id',async (req,res)=>{                              // Get attendance of all employees
    try{
        const ans = await Manager.findOne({managerID:req.params.id}) ;
        if(ans.AbsentDates.length > 0)
            absentdays = ans.AbsentDates.length ;
        else
            absentdays = 0 ;
        totaldays = new Date().getDate() ;


        const presentdays = totaldays - absentdays ;
        console.log(presentdays, absentdays, totaldays)
        res.status(200).send({"present":presentdays, "absent":absentdays, "total":totaldays}) ;
    } catch(err){
        res.status(500).json(err);
    }


});

module.exports = router