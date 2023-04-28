import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nicher/employee_login.dart';
import 'employee_list.dart';

bool  validateFormField(String? s)
{
  if(s!.isEmpty)
  {
    return true;
  }
  return false;
}


class CreateEmployee extends StatefulWidget {
  final ID;

  const CreateEmployee({super.key, this.ID});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Create Employee',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileBody(
            ID: widget.ID,
          );
        } else {
          return DesktopBody(
            ID: widget.ID,
          );
        }
      }),
    );
  }
}

class DesktopBody extends StatefulWidget {
  final ID;
  const DesktopBody({super.key, this.ID});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 400, right: 400),
      child: MobileBody(
        ID: widget.ID,
      ),
    );
  }
}

class MobileBody extends StatefulWidget {
  final ID;
  const MobileBody({super.key, this.ID});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  String name = "";
  String username = "";
  String password = "";
  String email = "";
  String gender = "";
  String address = "";
  String phoneno = "";
  String post = "";
  String salary = "";
  bool passwordVisible = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  Future<void> createEmployee() async {
    if (_formkey.currentState!.validate()) {
      var signupBody = {
        "EmployeeName": name,
        "UserName": username,
        "Password": password,
        "Email": email,
        "Gender": gender,
        "Address": address,
        "PhoneNo": phoneno,
        "Post": post,
        "Salary": int.parse(salary),
        "Manager":widget.ID
      };
      var response = await http.post(
          Uri.parse("https://nicher-o3ai.onrender.com/employee"),
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(signupBody));

     var jsonResponse = await jsonDecode(response.body);
     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ListOfEmployee(ID:widget.ID ,)));
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.account_circle,
                      //   color: Colors.black,
                      // ),
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Name can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.email_outlined,
                      //   color: Colors.black,
                      // ),
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    username = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Username can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.lock_outlined,
                      //   color: Colors.black,
                      // ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            // ignore: dead_code
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Password can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.email,
                      //   color: Colors.black,
                      // ),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Email can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.account_circle,
                      //   color: Colors.black,
                      // ),
                      hintText: "Gender",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    gender = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Gender can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.account_circle,
                      //   color: Colors.black,
                      // ),
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    address = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Address can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.account_circle,
                      //   color: Colors.black,
                      // ),
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    phoneno = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Phone number can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.account_circle,
                      //   color: Colors.black,
                      // ),
                      hintText: "Post",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    post = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Post can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      // prefixIcon: const Icon(
                      //   Icons.account_circle,
                      //   color: Colors.black,
                      // ),
                      hintText: "Salary",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Colors.white,
                      filled: true),
                  onChanged: (value) {
                    salary = value;
                  },
                  validator: (value) {
                    if (validateFormField(value)) {
                      return "Salary can not be empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async{
                   await createEmployee();
                    
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 3, color: Colors.white)),
                    child: const Center(
                      child: Text(
                        "Create Employee",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
