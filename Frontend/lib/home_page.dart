import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        elevation: 0.0,
        title: const Text(
          "Welcome to Home Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              height: 85,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 46, 106, 238),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        // margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        "Aditya Patel",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                      ),
                      Text(
                        "Software Engineer",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                    width: 100,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        // margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                        "202001020",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                      ),
                      Text(
                        "Cur Project - IT314",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ///////////////////////////
            Container(
              // padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              // margin: EdgeInsets.all(24),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 87, 89, 99),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),

              child: Row(
                children: [
                  Column(children: [
                    Text(
                      'Attendance',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 46, 106, 238)),
                    )
                  ]),
                ],
              ),
            ),
//////////////////////////////////////////////////////
            Container(
              // padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
              // margin: EdgeInsets.all(24),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              height: 85,
              width: 350,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 87, 89, 99),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(width: 2),
                  Column(children: [
                    Text(
                      '12',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Present',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ]),
                  const SizedBox(width: 10),
                  Column(children: [
                    Text(
                      '4',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Absent',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ]),
                  SizedBox(width: 10),
                  Column(children: [
                    Text(
                      '16',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ]),
                  // SizedBox(width: 2),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /////////////////////////
            Container(
              height: 480,
              width: 350,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 0, left: 0, right: 0, bottom: 20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 46, 106, 238),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 68,
                          width: 310,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/profile_page");
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
                              "My Profile",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 68,
                          width: 310,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/salary_status");
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
                              "Salary Status",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 68,
                          width: 310,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
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
                              "Attendance",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 68,
                          width: 310,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
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
                              "Performance",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(children: [
                              SizedBox(
                                height: 68,
                                width: 145,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/company_profile");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "About Co.",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              )
                            ]),
                            SizedBox(
                              width: 20,
                            ),
                            Column(children: [
                              SizedBox(
                                height: 68,
                                width: 145,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Log Out",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AttendanceShow {
//   late int releaseYear;
//   AttendanceShow(id) {
//     releaseYear = id;
//   }
// }

// AttendanceShow m1 = AttendanceShow(2021);
// AttendanceShow m2 = AttendanceShow(2022);
