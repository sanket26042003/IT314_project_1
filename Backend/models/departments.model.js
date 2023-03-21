const mongoose = require('mongoose');

var DepartmentSchema = new mongoose.Schema(
    {
        DepartmentID:{
            type: Number, 
            required: true
        },
        DepartmentName:{
            type: String,
            required: true
        },
        NumberOfEmployee:{  // A risky feature. Try to implement trigger https://www.mongodb.com/docs/manual/reference/operator/aggregation/add/
            type: Number,
            default: 0
        }
    }
)

module.exports = mongoose.model('Department', DepartmentSchema)

