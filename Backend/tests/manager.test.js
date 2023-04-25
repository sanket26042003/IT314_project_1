let chai = require('chai');
let chaiHttp = require('chai-http');

chai.should();
chai.use(chaiHttp);

const host = 'http://localhost:8000';
const path = '/manager'

describe('Testing GET manager profile', ()=>{
    it('should give profile', (done)=>{           // correct id
        chai
        .request(host)
        .get(path+'/1')
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('object');
            done();
            });
    });
    it('should not give profile', (done)=>{           // incorrect id
        chai
        .request(host)
        .get(path+'/100')
        .end((err,res)=>{
            res.should.not.have.status(200);
            done();
            });
    });
})


describe('Testing GET employee manager relation', ()=>{
    it('should give relation', (done)=>{           // correct id
        chai
        .request(host)
        .get(path+'/employeemanager/1')
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('array');
            done();
            });
    });
    it('should not give profile', (done)=>{           // incorrect id
        chai
        .request(host)
        .get(path+'/employeemanager/100')
        .end((err,res)=>{
            res.should.have.status(200);
            done();
            });
    });
})