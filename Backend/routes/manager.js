const express = require('express');
const router = express.Router();
const Manager = require('../models/manager.model')
const Employee = require('../models/employee.model')
const Stat = require('../models/stats.model')

router.post('/', async (req,res)=>{    // Create New manager
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

router.patch('/:id', async (req,res)=>{    // edit manager
    try{
        const result = await Manager.findOneAndUpdate({ManagerID: req.params.id}, req.body);
        res.send(`${req.body.ManagerName} successfully updated!!`)
    }catch(err){
        res.status(500).send(err.message)
    }
});

router.get('/:id', async(req, res)=>{ // manager profile
    try{
        const ans = await Manager.findOne({ManagerID:req.params.id});    // Get the employee document with given employeeID
        res.json(ans);
    }
    catch(err)
    {
        res.json(err) 
    }

});

module.exports = router