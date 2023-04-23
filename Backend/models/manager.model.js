const mongoose = require('mongoose') ;

var ManagerDetails = new mongoose.Schema(
    {
        ManagerID:{
            type: Number,
            required: true,
            default: 0
        },
        ManagerName:{
            type: String,
            required: true,
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
            field:'DepartmentID'
        },
        Project:{
            type: String
        },
        Salary:{
            type: Number,
            required: true
        }

    }
)

module.exports = mongoose.model('Manager', ManagerDetails)

