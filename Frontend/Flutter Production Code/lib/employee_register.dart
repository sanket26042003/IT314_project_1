import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeRegister extends StatelessWidget {
  const EmployeeRegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: size.width,
        color: const Color.fromARGB(255, 46, 106, 238),
        child: Column(
          children: [
            const UserButton(),
            Column(
              children: const [
                SizedBox(
                  height: 25,
                ),
                WelcomeText(),
                SizedBox(
                  height: 25,
                ),
                EmployeeRegisterForm()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EmployeeRegisterForm extends StatefulWidget {
  const EmployeeRegisterForm({
    super.key,
  });

  @override
  State<EmployeeRegisterForm> createState() => _EmployeeRegisterFormState();
}

class _EmployeeRegisterFormState extends State<EmployeeRegisterForm> {
  String email = "";
  String username = "";
  String password = "";

  bool passwordVisible = false;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void registerEmployee() async {
    print("hello");
    var response = await http.get(
          Uri.parse("http://10.200.6.59:8000/employee/"),
          
         );
    print("hello2");
      var jsonResponse = jsonDecode(response.body);
      print("hello3");
      print(jsonResponse);
    // if (_formkey.currentState!.validate()) {
    //   var regBody = {
    //     "email": email,
    //     "username": username,
    //     "password": password,
    //   };
    //   print(regBody);
    //   var response = await http.post(
    //       Uri.parse("http://localhost:3000/registration"),
    //       headers: <String, String>{"Content-Type": "application/json"},
    //       body: jsonEncode(regBody));
    //   var jsonResponse = jsonDecode(response.body);

    //   print(jsonResponse['status']);

    //   if (jsonResponse['status']) {
    //     print("Registration done successfully");
    //   } else {
    //     print("SomeThing Went Wrong");
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formkey,
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.black,
              ),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (value) {
              email = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "email can not be empty";
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person_outlined,
                color: Colors.black,
              ),
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (value) {
              username = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "username can not be empty";
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: passwordVisible,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock_outlined,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(
                    () {
                      passwordVisible = !passwordVisible;
                    },
                  );
                },
              ),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (value) {
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "password can not be empty";
              } else if (value.length < 8) {
                return "password should be atleast of 8 characters";
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              registerEmployee();
            },
            child: Container(
              width: 400,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 3, color: Colors.white)),
              child: const Center(
                child: Text(
                  "Register",
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Welcome to nicher",
      textScaleFactor: 1.2,
      style: TextStyle(
          color: Color.fromARGB(255, 221, 221, 221),
          fontWeight: FontWeight.bold),
    );
  }
}

class UserButton extends StatelessWidget {
  const UserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Center(
        child: SizedBox(
          width: 0.8 * size.width,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/welcome_page");
                },
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 46, 106, 238),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  width: 0.4 * size.width,
                  child: const Center(
                    child: Text(
                      "Employee",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 27, bottom: 27, right: 15, left: 15),
                  width: 0.4 * size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: const Color.fromARGB(255, 46, 106, 238),
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Manager",
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
