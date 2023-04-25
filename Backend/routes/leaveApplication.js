const express = require('express');
const router = express.Router();
const Employee = require('../models/employee.model')
const LeaveApplication = require('../models/leaveApplication.model')
const Stat = require('../models/stats.model')
const Manager = require('../models/manager.model')

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
        
        if(req.params.type == 1) {
            try{
                lapplication = await LeaveApplication.findOneAndUpdate({ApplicationNumber: req.params.id}, {ApplicationStatus: "Approved"}, {new:true});
            }catch(err){
                res.status(500).json(err)
            }
        } else {
            lapplication = await LeaveApplication.findOneAndUpdate({ApplicationNumber: req.params.id}, {ApplicationStatus: "Rejected"},{new:true});
        }
        res.status(200).json(lapplication);
    }catch(err){
        // console.log(err)
        res.status(500).json(err)
    }
});

// router.get('/:id', async function(req, res){   // All leave appllication of a particular manager
//     try{
        
//         const query = await LeaveApplication.aggregate([
//             {$match: {ResponsibleManagerID: req.params.id}},
//             {$lookup: {from:'Manager', localField:'ResponsibleManagerID', foreignField:'ManagerID', as:'managerdata'}}
//         ])
//         console.log(query)






//         res.status(200).json(query);
//     }
//     catch(err){
//         console.log(err)
//         res.status(500).json(err)
//     }
// });

router.get('/:id', async function(req, res){   // All leave appllication of a particular manager
    try{
        const query = await LeaveApplication.find({ResponsibleManagerID:req.params.id});
        res.status(200).json(query);
    }
    catch(err){
        res.status(500).json(err)
    }
});


router.get('/employeeleave/:id', async function(req, res){   // All leave appllication of a particular employee
    try{
        const ans = await Employee.findOne({EmployeeID:req.params.id})
        const query = await LeaveApplication.find({ResponsibleManagerID:ans.Manager});
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