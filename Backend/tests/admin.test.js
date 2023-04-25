let chai = require('chai');
let chaiHttp = require('chai-http');

chai.should();
chai.use(chaiHttp);

const host = 'http://localhost:8000';
const path = '/admin'

describe('Testing admin', ()=>{
    it('should return all departments', (done)=>{
        chai
        .request(host)
        .get(path)
        .end((err,res)=>{
            res.should.have.status(200);
            res.body.should.be.a('array');
            done();
            });
    })
})