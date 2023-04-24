const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model');
router.get('/', async(req,res)=>{
    try{
        const ans = await Department.find();
        res.json(ans);
    }
    catch(err)
    {
        res.json(err)
    }
});

module.exports = router ;