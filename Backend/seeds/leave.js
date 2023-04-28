const mongoose = require('mongoose');
const Leave = require('../models/leaveApplication.model')
const Employee = require('../models/employee.model')

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
  await Leave.deleteMany({});
  for (let i = 0; i < 50; i++) {
    const temp = Math.floor(Math.random() * 150)+1;
    const emp = await Employee.findOne({"EmployeeID": temp});
    const arr = ['Medical', 'WFH', 'Parental', 'Others'];
    const arr2 = ['In Process', 'Rejected', 'Approved'];
    const lea = new Leave({
        ApplicationNumber: i+1,
        ApplicantEmployeeID: temp,
        ApplicantName: emp.EmployeeName,
        ApplicationType: arr[Math.floor(Math.random() * 4)],
        LeaveStartDate: "2023-04-23T12:29:35.772+00:00",
        LeaveEndDate: "2023-04-25T12:29:35.772+00:00",
        ApplicationDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed lectus placerat, lacinia purus sed, venenatis quam. Proin non tincidunt mauris.",
        ApplicationStatus: arr2[Math.floor(Math.random() * 3)],
        ResponsibleManagerID: emp.Manager
    })
    await lea.save();
  }
}

seedDb()
  .then(() => { mongoose.connection.close(); })