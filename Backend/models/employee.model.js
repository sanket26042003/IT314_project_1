const mongoose = require('mongoose') ;
const Department = require('./departments.model')

var EmployeeDetails = new mongoose.Schema(
    {
        EmployeeID:{
            type: Number,
            required: true,
            default: 0 
        },
        EmployeeName:{
            type: String,
            required: true
        },
        Gender:{
            type: String
        },
        Address:{
            type: String
        },
        PhoneNo:{
            type: String,
            required: true
        }, 
        Department:{
            type: mongoose.Schema.Types.Number,
            ref: 'Department',     // Reference to departments table.
            field:'DepartmentID',
            required: false
        },
        CurrentProject:{
            type: String
        },
        Post:{
            type: String,
            required: true
        },
        Salary:{
            type: Number,
            required: true
        },
        Manager:{
            type: mongoose.Schema.Types.Number,
            ref: 'Manager'     // Reference to Manager table.
        },
        DateOfJoining:{
            type: Date,
            default: Date.now()
        },
        DateOfBirth:{
            type: Date
        },
        AbsentDates : [{
            type: Date,
        }]
    }
)

module.exports = mongoose.model('Employee', EmployeeDetails)

