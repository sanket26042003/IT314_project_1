import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Center(
          child: Container(
            height: 0.5*size.height,
            width: size.width,
            child: Image.network(
              'https://media.istockphoto.com/id/1248415323/photo/3d-illustration-of-happy-smiling-businessman-in-suit-with-laptop-sitting-in-armchair-cartoon.jpg?s=612x612&w=0&k=20&c=pQQez7m8lNwrlZsJNdCPVixdfCZfA8vQl6Zgmu6D_Vo=',
              scale: 0.3,
            ),
          ),
        ),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 46, 106, 238),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          margin: const EdgeInsets.only(bottom: 0),
          height: 0.5 * size.height,
          width: size.width,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 75, bottom: 75, left: 50, right: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Welcome to nicher",
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.2,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "This is the dummy text for the mobile application",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Color.fromARGB(215, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 0.70 * size.width,
                    height: 0.120 * size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/employee_login");
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            const Color.fromARGB(255, 86, 135, 240),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 0.70 * size.width,
                    height: 0.120 * size.width,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushNamed(context, "/employee_register");
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ))
      ]),
    );
  }
}