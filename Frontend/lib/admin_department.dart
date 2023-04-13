import 'package:flutter/material.dart';

class AdminDepartment extends StatelessWidget {
  const AdminDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        elevation: 0.0,
        title: const Text(
          "Departments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: 2000,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.zero,
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 46, 106, 238),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Total number of departments - 10",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "List of departments",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/manager_department");
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          //side: const BorderSide(style: BorderStyle.solid)
                        )),
                    child: const Text(
                      "Frontend",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/manager_department");
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          //side: const BorderSide(style: BorderStyle.solid)
                        )),
                    child: const Text(
                      "Backend",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/manager_department");
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          //side: const BorderSide(style: BorderStyle.solid)
                        )),
                    child: const Text(
                      "UI/UX",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
