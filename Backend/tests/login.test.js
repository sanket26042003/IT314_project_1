let chai = require('chai');
let chaiHttp = require('chai-http');

chai.should();
chai.use(chaiHttp);

const host = 'http://localhost:8000';
const path = '/login'

describe('Testing employeelogin', ()=>{
    it('should login the employee', (done)=>{           // correct username and password
        chai
        .request(host)
        .post(path+'/employeelogin')
        .send({"UserName":"SD","Password":"test"})
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not login the employee', (done)=>{        // wrong username and password
        chai
        .request(host)
        .post(path+'/employeelogin')
        .send({"UserName":"Sanket","Password":"test"})
        .end((err,res)=>{
            res.should.not.have.status(200);
            done();
            });
    });
})


describe('Testing managerlogin', ()=>{
    it('should login the manager', (done)=>{           // correct username and password
        chai
        .request(host)
        .post(path+'/managerlogin')
        .send({"UserName":"sir","Password":"test"})
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not login the manager', (done)=>{        // wrong username and password
        chai
        .request(host)
        .post(path+'/managerlogin')
        .send({"UserName":"Sanket","Password":"test"})
        .end((err,res)=>{
            res.should.not.have.status(200);
            done();
            });
    });
})



describe('Testing adminlogin', ()=>{
    it('should login the admin', (done)=>{           // correct username and password
        chai
        .request(host)
        .post(path+'/adminlogin')
        .send({"UserName":"admin","Password":"admin"})
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not login the manager', (done)=>{        // wrong username and password
        chai
        .request(host)
        .post(path+'/adminlogin')
        .send({"UserName":"Sanket","Password":"test"})
        .end((err,res)=>{
            res.should.not.have.status(200);
            done();
            });
    });
})