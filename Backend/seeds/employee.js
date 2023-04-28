const mongoose = require('mongoose');
const Employee = require('../models/employee.model')
const {name, dep, man} = require('./dataset')

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
  await Employee.deleteMany({});
  for (let i = 0; i < 150; i++) {
    const temp = `${randomElement(name.fname)} ${randomElement(name.lname)}`;
    const temp2 = Math.floor(Math.random() * 15)+1;
    const emp = new Employee({
        EmployeeID: i+1,
        EmployeeName: temp,
        UserName: `${temp.split(' ')[0]}_${i+1}`,
        Password: "0000",
        Email: `${temp.split(' ')[0]}${Math.floor(Math.random() * 2000)+1}@gmail.com`,
        Gender: `M`,
        Address: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed lectus placerat, lacinia purus sed, venenatis quam. Proin non tincidunt mauris.',
        PhoneNo: '9123456789',
        Manager: temp2,
        Department: `${man.mandep[temp2-1]}`,
        DepartmentName: `${dep.depname[temp2-1]}`,
        Post: "Engineer",
        Project: `P${temp2}`,
        Salary: Math.floor(Math.random() * 1200000)+300001,
        DateOfJoining: "2020-01-01T12:29:35.772+00:00",
        DateOfBirth: "2000-01-01T12:29:35.772+00:00",
        AbsentDates : [
            "2023-04-23T12:29:35.772+00:00",
            "2023-04-24T19:30:00.898+00:00",
            "2023-04-25T18:43:00.484+00:00"
        ]
    })
    await emp.save();
  }
}

seedDb()
  .then(() => { mongoose.connection.close(); })