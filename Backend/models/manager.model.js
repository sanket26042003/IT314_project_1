const mongoose = require('mongoose') ;
const bcrypt = require('bcrypt');

var ManagerDetails = new mongoose.Schema(
    {
        ManagerID:{
            type: Number,
            required: true,
            default: 0,
            unique: true
        },
        ManagerName:{
            type: String,
            required: true,
        },
        UserName:{
            type: String,
            required: true,
            unique: true
        },
        Password:{
            type: String
        },
        Email:{
            type: String
        },
        Gender:{
            type: String,
            required: true
        },
        Address:{
            type: String,
            required:true
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
        DepartmentName:{
            type: String,
        },
        Project:{
            type: String
        },
        Salary:{
            type: Number,
            required: true
        },
        AbsentDates : [{
            type: Date
        }]

    }
)



ManagerDetails.pre('save',async function() {
    try {
        // const salt= await(bcrypt.genSalt(10));
        const salt = 10 ;
        const hashPass=await bcrypt.hash(this.Password,salt);
        this.Password=hashPass; 
        
    } catch (error) {
        throw error;
    }
});

ManagerDetails.methods.comparePassword=async function (candidatePassword) {
    try {
        const isMatch=await bcrypt.compare(candidatePassword,this.Password);
        return isMatch;
    } catch (error) {
        console.log('er')
        throw error
    }
};


module.exports = mongoose.model('Manager', ManagerDetails)

