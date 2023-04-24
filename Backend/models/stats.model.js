const mongoose = require('mongoose');

var statSchema = new mongoose.Schema(
    {
        NoOfEmployee:{
            type: Number,
            default: 0
        },
        NoOfManager:{
            type: Number,
            default: 0
        },
        NoOfApplication:{
            type: Number,
            default: 0
        }
        // Attendance: {
        //     type: [{
        //         key: {
        //             type: Number,
        //             required: true
        //         },
        //         value : {
        //             type: Boolean,
        //             default: false
        //         }
        //     }]
        // }
    }
)

module.exports = mongoose.model('Stat', statSchema);