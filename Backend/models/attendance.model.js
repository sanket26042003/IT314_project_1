const mongoose = require('mongoose') ;

var attendanceSchema = new mongoose.Schema(
    {
        EmployeeID:{
            type: mongoose.Schema.Types.Number,
            ref:'Employee',
            required: true 
        },
        AbsentThisMonth:{
            type: [Date], // Array of absent date
            default:[] 
        },
        AbsentPrevMonth:{
            type:[Date]
        }
    }
)

module.exports = mongoose.model('Attendance', attendanceSchema)