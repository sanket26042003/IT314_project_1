let chai = require('chai');
let chaiHttp = require('chai-http');

chai.should();
chai.use(chaiHttp);

const host = 'http://localhost:8000';
const path = '/employee'

describe('Testing GET allemployee', ()=>{
    it('should give all employees', (done)=>{           // correct username and password
        chai
        .request(host)
        .get(path+'/allemployee')
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('array');
            done();
            });
    });
})


describe('Testing GET attendance', ()=>{
    it('should give data', (done)=>{           // correct id
        chai
        .request(host)
        .get(path+'/attendance/1')
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not give data', (done)=>{           // correct id
        chai
        .request(host)
        .get(path+'/attendance/100')
        .end((err,res)=>{
            res.should.not.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
})


describe('Testing POST create new employee', ()=>{
    it('should create new employee', (done)=>{           // correct username and password
                                                           // uncomment it for final test. commented to prevent db
        chai
        .request(host)
        .post(path)
        .send({
            "EmployeeID": 3,
            "EmployeeName": "Test Employee",    // need to write a unique username everytime
            "UserName": "user",
            "Password": "user",
            "Email": "user",
            "PhoneNo":"1221332",
            "Post":"QA",
            "Salary": 10000,
            "Manager": 1
        })
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not create new employee', (done)=>{           // correct username and password
        chai
        .request(host)
        .post(path)
        .send({
            "EmployeeID": 3,
            "EmployeeName": "Test Employee",    // need to write a unique username everytime
            "UserName": "user",
            "Password": "user",
            "Email": "user",
            "PhoneNo":"1221332",
            "Post":"QA",
            "Salary": 10000,
            "Manager": 1
        })
        .end((err,res)=>{
            res.should.not.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
})