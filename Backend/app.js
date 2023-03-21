const express = require('express');
const mongoose = require('mongoose');
require('./models/employee.model');
require('dotenv').config() ;
const port = process.env.PORT || "8000";
const usersRoute = require('./routes/index.js');
const app = express() ;

app.use(express.urlencoded({extended:false}));
app.use(express.json()) ;

const dbURI = process.env.DB_URI ;

mongoose
    .connect(dbURI, {
        useNewUrlParser: true,
    })
    .then(()=>console.log("Database connection successful"))
    .catch((err)=>{console.log(err)}) ;


mongoose.Promise = global.Promise ;

// app.use('/', (req,res)=>{
//     res.send("Hello Express Nicher")
// });

app.use('/', usersRoute);

module.exports = app ;

app.listen(port,()=>{
    console.log(`Listening to requests on http://localhost"${port}`);
});