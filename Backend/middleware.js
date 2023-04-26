const jwt = require('jsonwebtoken');

module.exports.isLoggedIn = (req, res, next) => {
    const token = req.cookies.access_token;
    try {
        if (!token) {
          throw new Error("Not logged in");
        }
        const data = jwt.verify(token, "secret");
        req.id = data.id;
        req.username = data.username;
        req.position = data.position;
        return next();
    } catch (err){
        console.log(err);
        return res
        .status(500)
        .send("Forbidden");
    }
}

module.exports.isManager = (req, res, next) => {
    try{
        if(req.position == 0){
            throw new  Error("Not a manager or an admin")
        }
        return next();
    } catch(err) {
        console.log(err);
        return res
        .status(500)
        .send("Forbidden")
    }
}
module.exports.isAdmin = (req, res, next) => {
    try{
        if(req.position == 0 || req.position == 1){
            throw new  Error("Not an admin")
        }
        return next();
    } catch(err) {
        console.log(err);
        return res
        .status(500)
        .send("Forbidden")
    }
}