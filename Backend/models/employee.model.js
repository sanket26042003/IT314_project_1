const mongoose = require('mongoose') ;
const Department = require('./departments.model')
const plm = require('passport-local-mongoose');
const bcrypt = require('bcrypt');

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
        UserName: {
            type: String,
            required: true,
            unique: true
        },
        Password: {
            type: String,
            required: true,
        },
        Email: {
            type: String,
            required: true,
            unique: true
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
            ref: 'Manager',     // Reference to Manager table.
            index:true
        },
        DateOfJoining:{
            type: Date,
            default: Date.now()
        },
        DateOfBirth:{
            type: Date
        },
        AbsentDates : [{
            type: Date
        }]
    }
)




EmployeeDetails.pre('save',async function() {
    try {
        // const salt= await(bcrypt.genSalt(10));
        const salt = 10 ;
        const hashPass=await bcrypt.hash(this.Password,salt);
        this.Password=hashPass; 
        
    } catch (error) {
        throw error;
    }
});

EmployeeDetails.methods.comparePassword=async function (candidatePassword) {
    try {
        const isMatch=await bcrypt.compare(candidatePassword,this.Password);
        return isMatch;
    } catch (error) {
        console.log('er')
        throw error
    }
};


// EmployeeDetails.pre('save',async function() {
    //     try {
    //         const salt= await(bcrypt.genSalt(10,(err,salt)=>{
    //             const hashPass=bcrypt.hash(this.Password,salt,(err,hash)=>{
    //         });
    //         }));
            
    //         this.Password=hashPass; 
            
    //     } catch (error) {
    //         throw error;
    //     }
    // });

module.exports = mongoose.model('Employee', EmployeeDetails)

