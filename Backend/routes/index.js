const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model')
const Stat = require('../models/stats.model')
const cron = require('node-cron')
const Employee = require('../models/employee.model')
const Manager = require('../models/manager.model')


// Initialization
// async function StatInitialize() {
//     const check = await Stat.findOne();
//     if(!check)
//         await Stat.create({});
// }
// StatInitialize();

// Attendance Controller

async function AttendanceController(){
    await Employee.updateMany({},{$push:{"AbsentDates":new Date()}},{new:true})     // date is added to absent array
    await Manager.updateMany({},{$push:{"AbsentDates":new Date()}}, {new:true})     
}

cron.schedule('0 1 0 * * *', function(){   // A trigger to execute at 00:01 everyday. 
    AttendanceController() ;
});




// const def_attendance = async()=>{
//     const employee = await Employee.find({});
//     for(let e of employee)
//     {
//         e.AbsentDates.push(Date.now());
//     }   
// };

// a few random routes
// -----------------------------------------------------------------------


router.get('/', async (req,res)=>{     // home page
    try{
        res.status(200).send('Hello')
    }catch(err){
        res.status(500).send(err.message)
    }
});

router.get('/logout', async (req,res)=>{     // home page
    try{
        res.clearCookie('access_token');
        res.redirect('/');
    }catch(err){
        console.log(err)
        res.status(500).send(err.message)
    }
});

router.get('/department', async (req,res)=>{    // show New department
    try{
        res.status(200).send(Department)
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;
 
// router.post('/attendance/', async (req, res)=>{      // Absent date will be added to employee's absent list
//     try{
//         Attendance.findOne({EmployeeID:req.params.id}).then((doc)=>{
//             doc.AbsentThisMonth.push(Date.now());
//             doc.save() ;
//         })
//         res.json(doc)
//     }
//     catch(err){
//         res.json(err)
//     }
// });


// -------------------------------------------------------------------------


module.exports = router