const express = require('express');
const router = express.Router();
const Department = require('../models/departments.model')
const Attendance = require('../models/attendance.model')
const Stat = require('../models/stats.model')
const cron = require('node-cron')
const Employee = require('../models/employee.model')

// Initialization
async function StatInitialize() {
    await Stat.create({});
}
StatInitialize();

cron.schedule('0 0 0 * * *', function(){   // A trigger set to execute any node function at a given time. Here it is 1st of every month at 00:01
    console.log("Done");

});

const def_attendance = async()=>{
    const employee = await Employee.find({});
    for(let e of employee)
    {
        e.AbsentDates.push(Date.now());
    }
};

// a few random routes
// -----------------------------------------------------------------------



router.get('/', async (req,res)=>{     // home page
    try{
        res.send('Hello')
    }catch(err){
        res.status(500).send(err.message)
    }
}) ;

router.get('/department', async (req,res)=>{    // show New department
    try{
        res.send(Department)
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