const mongoose = require('mongoose');
const employee = require('./employee.model')
const Manager = require('./manager.model')

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
        ApplicantName:{
            type: String
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
            // type: mongoose.Schema.Types.Number  , // Reference to Employee table for manager
            type:Number,
            // ref:'Manager',
            // field:'ManagerID',
            default:-1,
            index: true
        }
    }
)


module.exports = mongoose.model('LeaveApplication', leaveApplicationSchema)