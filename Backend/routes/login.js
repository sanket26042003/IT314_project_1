const express = require('express');
const router = express.Router();
const passport = require('passport');

router.post('/login', passport.authenticate('local'), async function(req, res){
    try{
        res.send('Succesfully logged in!');
    }
    catch(err){
        res.status(500).send(err.message)
    }
});

router.get('/logout', function(req, res){
    req.logout(function(err) {
        try{
            res.send('Succesfully logged out!');
        }
        catch(err){
            res.status(500).send(err.message)
        }
    });
});

module.exports = router;