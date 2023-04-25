const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model');
router.get('/', async(req,res)=>{
    try{
        const ans = await Department.find();
        res.status(200).json(ans);
    }
    catch(err)
    {
        res.status(500).json(err)
    }
});

module.exports = router ;