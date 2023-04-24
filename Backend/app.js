// --------------------- Requires --------------------------

const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors')
const User = require('./models/employee.model');
const usersRoute = require('./routes/index.js');
const employee = require('./routes/employee')
const leaveApplication = require('./routes/leaveApplication')
const manager = require('./routes/manager');
const login = require('./routes/login');
const admin = require('./routes/admin');

const session = require('express-session');

const passport = require('passport');
const localStrategy = require('passport-local');
require('dotenv').config();
const { MongoClient, ServerApiVersion } = require('mongodb');

const port = process.env.PORT || "8000";


// ----------------------------------------------------------


const app = express();


// --------------------- Midleware --------------------------

app.use(express.urlencoded({extended:true}));
app.use(express.json()) ;

// ----------------------------------------------------------




// --------------- Connecting Database -----------------------

mongoose.Promise = global.Promise;
const dbURI = process.env.DB_URI ;

// mongoose
// .connect(dbURI, {
//     useNewUrlParser: true,
// })
// .then(()=>console.log("Database connection successful"))
// .catch((err)=>{console.log(err)}) ;



// Create a MongoClient with a MongoClientOptions object to set the Stable API version
const uri = process.env.DB_URI
mongoose
  .connect(uri, {
    useNewUrlParser: true
  })
  .then(x => {
    console.log(
      `Connected to Mongo! Database name: "${x.connections[0].name}"`
    );
  })
  .catch(err => {
    console.error("Error connecting to mongo", err);
  });




// -----------------------------------------------------------




// --------------- configuring session -----------------------

// const sessionConfig = {
//     secret: 'itisasecret',
//     cookie: {
//         expires: Date.now() + 1000*60*60*24*3,
//         maxAge: 1000*60*60*24*3
//     },
//     resave: false,
//     saveUninitialized: true
// }

// app.use(session(sessionConfig));

// -------------------------------------------------------------



// --------------- configuring passsport -----------------------

// app.use(passport.initialize());
// app.use(passport.session());

// passport.use(new localStrategy(User.authenticate()));

// passport.serializeUser(User.serializeUser());
// passport.deserializeUser(User.deserializeUser());

// -------------------------------------------------------------
app.use((req, res, next) => {          //CORS error handling
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type,Authorization,Origin,X-Requested-With,Accept');
  next();
});
app.use('/', usersRoute);
app.use('/employee', employee);
app.use('/leave', leaveApplication);
app.use('/manager', manager);
app.use('/login', login);
app.use('/admin',admin);

module.exports = app;

app.listen(port,()=>{
    console.log(`Listening to requests on http://localhost:${port}`);
}); 