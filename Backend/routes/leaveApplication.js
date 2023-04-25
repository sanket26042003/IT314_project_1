const express = require('express');
const router = express.Router();
const Employee = require('../models/employee.model')
const LeaveApplication = require('../models/leaveApplication.model')
const Stat = require('../models/stats.model')

router.post('/', async(req, res)=>{     // create New Leave application
    try{
        const newleave = new LeaveApplication(req.body)
        const ans = await Employee.findOne({EmployeeID:newleave.ApplicantEmployeeID})
        if(!ans) return res.status(500).send({"error":"Employee does not exist"});
        newleave.ResponsibleManagerID = ans.Manager
        var query =  await Stat.findOneAndUpdate({},       // to increment no. of employees which will define application ID
        {$inc:{NoOfApplication:1}},
        {new:true});
        newleave.ApplicationNumber = query.NoOfApplication
        const result = await LeaveApplication.create(newleave);
        res.status(200).send({"success":"true"}) ;
    }catch(err){
        res.status(500).json(err)
    }
});

router.post('/:id/:type', async(req, res)=>{     // Approve Leave application
    try{
        // here var name is temp, boolval will be later changed to actual name
        // type will be 1 for approval and 0 for rejection
        if(req.params.type) {
            try{
                const lapplication = await LeaveApplication.findOneAndUpdate({ApplicationNumber: req.params.id}, {ApplicationStatus: "Approved"});
            }catch(err){
                res.json(err)
            }
        } else {
            const lapplication = LeaveApplication.findOneAndUpdate({ApplicationNumber: req.params.id}, {ApplicationStatus: "Rejected"});
        }
        res.status(200).json(lapplication);
    }catch(err){
        res.status(500).json(err)
    }
});

router.get('/:id', async function(req, res){   // All leave appllication of a particular manager
    try{
        const query = await LeaveApplication.find({ResponsibleManagerID:req.params.id});
        res.status(200).json(query);
    }
    catch(err){
        res.status(500).json(err)
    }
});

router.patch('/:id', async function(req, res){
    try{
        const query = await LeaveApplication.findOneAndUpdate({ApplicationNumber:req.params.id}, req.body, {new:true}) ;
        res.status(200).json(query)
    }
    catch(err){
        res.status(500).json(err)
    }
});

module.exports = router