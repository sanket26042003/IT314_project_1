const mongoose = require('mongoose');
const Employee = require('../models/employee.model')
const Department = require('../models/departments.model')
const {dep} = require('./dataset')

mongoose.Promise = global.Promise;

// const uri = "mongodb://localhost:27017/Nicher?"
const uri = "mongodb+srv://admin:admin@cluster0.yv6vpfa.mongodb.net/Nicher?retryWrites=true&w=majority"
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

const randomElement = arr => arr[Math.floor(Math.random() * arr.length)];

const seedDb = async () => {
  await Department.deleteMany({});
  for (let i = 0; i < 15; i++) {
    const num = await Employee.find({"Department": i+1});
    const depart = new Department({
        DepartmentID: i+1,
        DepartmentName: `${dep.depname[i]}`,
        CurrentProject: `P${i+1}`,
        NumberOfEmployee: num.length,
        Manager:i+1
    })
    await depart.save();
  }
}

seedDb()
  .then(() => { mongoose.connection.close(); })