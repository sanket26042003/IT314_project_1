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
    }
)

module.exports = mongoose.model('Stat', statSchema);