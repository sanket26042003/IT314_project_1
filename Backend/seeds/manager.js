const mongoose = require('mongoose');
const Manager = require('../models/manager.model')
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
  await Manager.deleteMany({});
  for (let i = 0; i < 15; i++) {
    const temp = `${randomElement(name.fname)} ${randomElement(name.lname)}`;
    const manage = new Manager({
        ManagerID: i+1,
        ManagerName: `${temp}`,
        UserName: `${temp.split(' ')[0]}_${i+1}`,
        Password: "0000",
        Email: `${temp.split(' ')[0]}${Math.floor(Math.random() * 2000)+1}@gmail.com`,
        Gender: `M`,
        Address: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed lectus placerat, lacinia purus sed, venenatis quam. Proin non tincidunt mauris. Pellentesque commodo interdum semper. Vestibulum non nisi ut nunc porttitor facilisis. Etiam eget leo maximus, luctus nisl a, consectetur sapien. Nulla varius tristique dui. Fusce quis ultrices elit.',
        PhoneNo: '9123456789',
        Department: i+1,
        DepartmentName: `${dep.depname[i]}`,
        Post: "Engineer",
        Project: `P${i+1}`,
        Salary: Math.floor(Math.random() * 1200000)+300001,
        DateOfJoining: "2020-01-01T12:29:35.772+00:00",
        DateOfBirth: "2000-01-01T12:29:35.772+00:00",
    })
    await manage.save();
  }
}

seedDb()
  .then(() => { mongoose.connection.close(); })