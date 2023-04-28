const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model');
const { isLoggedIn, isManager, isAdmin } = require('../middleware')

router.get('/', isLoggedIn, isAdmin, async(req,res)=>{
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