const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const Employee = require('../models/employee.model')
const Manager = require('../models/manager.model')

router.post('/employeelogin', async (req, res) => {
    let user;
    try {

        const { UserName, Password } = req.body;
        user = await Employee.findOne({ "UserName": UserName });
        if (!user) {
            throw new Error("User does not exist");
        }

        const isPasswordCorrect = await user.comparePassword(Password);
        if (!isPasswordCorrect) {
            throw new Error("Password is not correct");
        }

        // creating token
        let tokenData = {
            id: user.EmployeeID,
            username: user.UserName,
            position: "0" // 0 for employee
        };

        const token = await jwt.sign(tokenData, "secret", { expiresIn: 60*2 });

        return res
        .status(200)
        .cookie("access_token", token, {
            httpOnly: true,
            secure: process.Env.NODE_ENV === "production",
        })
        .json({
            status: true,
            success: "SendData",
            token: token
        })

    } catch (err) {
        console.log(err);
        return res
            .status(500)
            .send("Error Occured");
        // next(error);
    }
});

router.post('/managerlogin', async (req, res) => {
    let user;
    try {
        const { UserName, Password } = req.body;

        user = await Manager.findOne({ UserName: UserName });
        if (!user) {
            throw new Error("User does not exist");
        }

        const isPasswordCorrect = await user.comparePassword(Password);
        if (!isPasswordCorrect) {
            throw new Error("Password is not correct");
        }

        // creating token
        let tokenData = {
            id: user.ManagerID,
            username: user.UserName,
            position: "1" // 1 for manager
        };

        const token = await jwt.sign(tokenData, "secret", { expiresIn: 60*2 });

        res
        .status(200)
        .cookie("access_token", token, {
            httpOnly: true,
            secure: process.env.NODE_ENV === "production",
        })
        .json({
            status: true,
            success: "SendData",
            token: token
        })

    } catch (err) {
        console.log(err);
        return res
            .status(500)
            .send("Error Occured");
    }
});


router.post('/adminlogin', async (req, res) => {
    let user;
    try {
        const { UserName, Password } = req.body;
        const isPasswordCorrect = "admin" === Password;
        const isUserCorrect = "admin" === UserName;

        if (isPasswordCorrect == false || isUserCorrect == false) {
            throw new Error("Username or Password incorrect");
        }

        // creating token
        let tokenData = {
            id: 0,
            username: "admin",
            position: "2" // 0 for admin
        };

        const token = await jwt.sign(tokenData, "secret", { expiresIn: 60*2 });

        res
        .status(200)
        .cookie("access_token", token, {
            httpOnly: true,
            secure: process.env.NODE_ENV === "production",
        })
        .json({
            status: true,
            success: "SendData",
            token: token
        })
    } catch (err) {
        console.log(err);
        return res
            .status(500)
            .send("Error Occured");
    }
});


module.exports = router;