const mongoose = require('mongoose');
const employee = require('./employee.model')

var leaveApplicationSchema = new mongoose.Schema(
    {
        ApplicationNumber:{
            type: Number,
            required: true,
            default: 0
        },
        ApplicantEmployeeID:{
            type: mongoose.Schema.Types.Number, // Reference to Employee table
            ref:'Employee',
            field:'EmployeeID',
            required: true
        },
        ApplicationType:{
            type: String,
            allowedValues: ['Medical', 'WFH', 'Parental', 'Others'],
            required: true
        },
        LeaveStartDate:{
            type: Date,
            required: true
        },
        LeaveEndDate:{
            type: Date,
            required: true
        },
        ApplicationDescription:{
            type: String
        },
        ApplicationStatus:{
            type: String,
            allowedValues: ['In Process', 'Rejected', 'Approved'],
            default: 'In Process'
        },
        ResponsibleManagerID:{
            type: mongoose.Schema.Types.Number, // Reference to Employee table for manager
            ref:'Manager',
            default:-1
        }
    }
)


module.exports = mongoose.model('LeaveApplication', leaveApplicationSchema)