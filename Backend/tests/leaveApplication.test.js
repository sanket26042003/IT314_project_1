let chai = require('chai');
let chaiHttp = require('chai-http');

chai.should();
chai.use(chaiHttp);

const host = 'http://localhost:8000';
const path = '/leave'

describe('Testing GET leave application', ()=>{
    it('should give applications', (done)=>{           // correct id
        chai
        .request(host)
        .get(path+'/1')
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('array');
            done();
            });
    });
    it('should not give applications', (done)=>{           // incorrect id
        chai
        .request(host)
        .get(path+'/100')
        .end((err,res)=>{
            const len = res.body.length ;
            res.body.length.should.be.equal(0);
            done();
            });
    });
})


describe('Testing POST leave application', ()=>{
    it('should create applications', (done)=>{           // correct id
                                                    //comment should be removed while testing
        chai
        .request(host)
        .post(path)
        .send({
            "ApplicationNumber":3,
            "ApplicantEmployeeID":6,
            "ApplicationType":"Medical",
            "LeaveStartDate":"2020-12-12",
            "LeaveEndDate":"2020-12-12"
        })
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should create applications', (done)=>{           // correct id
        // comment should be removed while testing
    chai
    .request(host)
    .post(path)
    .send({
        "ApplicationNumber":3,
        "ApplicantEmployeeID":150,
        "ApplicationType":"Medical",
        "LeaveStartDate":"2020-12-12",
        "LeaveEndDate":"2020-12-12"
    })
    .end((err,res)=>{
        res.should.not.have.status(200);
        res.body.should.be.a('object');
        done();
        });
});

describe('Testing POST approve leave application', ()=>{
    it('should approve applications', (done)=>{           // correct id
        chai
        .request(host)
        .post(path+'/2/1')
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not approve applications', (done)=>{           // incorrect id
        chai
        .request(host)
        .post(path+'/100/0')
        .end((err,res)=>{
            res.should.not.have.status(200);
            done();
            });
    });
})

    
})



