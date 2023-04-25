import 'package:flutter/material.dart';
import 'package:testing/profile_page.dart';

class CreateEmployee extends StatelessWidget {
  const CreateEmployee({super.key});

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
          return const MobileBody();
        } else {
          return const DesktopBody();
        }
      }),
    );
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 400, right: 400),
      child: MobileBody(),
    );
  }
}

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
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

    return Container(
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
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
                  if (value!.isEmpty) {
                    return "password can not be empty";
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
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
                  if (value!.isEmpty) {
                    return "username can not be empty";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
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
    );
  }
}
