import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:nicher/drawer.dart';
import 'package:nicher/leave_application.dart';

class LeaveApproval extends StatefulWidget {
  final token;
  const LeaveApproval({super.key, @required this.token});

  @override
  State<LeaveApproval> createState() => _LeaveApprovalState();
}

class _LeaveApprovalState extends State<LeaveApproval> {
  late String username;
  late String position;
  late int ID;
  late Future<int> cnt;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    username = jwtDecodedToken['username'];
    position = jwtDecodedToken['position'];
    ID = jwtDecodedToken['id'];
  }

  Future<int> getCounterValue() async {
    var response = await http.get(
      Uri.parse("http://localhost:3000/cnt"),
    );

    var jsonResponse = jsonDecode(response.body);
    return jsonResponse['cnt'];
  }

  void _onUpdateCounter() {
    setState(() {
      cnt = getCounterValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MyDrawer(
        token: widget.token,
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        title: const Text(
          "nicher",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.person,
        //       color: Color.fromARGB(255, 255, 255, 255),
        //     ),
        //   )
        // ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return DesktopBody(
            ID: ID,
          );
        } else {
          return DesktopBody(
            ID: ID,
          );
        }
      }),
    );
  }
}

class DesktopBody extends StatefulWidget {
  final int ID;
  const DesktopBody({super.key, required this.ID});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  Future<List<dynamic>> fetchData() async {
    var response = await http.get(
      Uri.parse("https://nicher-o3ai.onrender.com/leave/${widget.ID}"),
    );
    var jsonResponse = await jsonDecode(response.body);
    return jsonResponse;
  }

  Future<void> approveLeave(int applicationID) async {
    var leaveBody = {};
    var response = await http.post(
        Uri.parse("https://nicher-o3ai.onrender.com/leave/${applicationID}/1"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(leaveBody));
  }

  Future<void> rejectLeave(int applicationID) async {
    var leaveBody = {};
    var response = await http.post(
        Uri.parse("https://nicher-o3ai.onrender.com/leave/${applicationID}/0"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(leaveBody));
  }
  String getDate(String date) {
    date = date.substring(0, 10);
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String dd = date.substring(8, 10);
    return dd + "-" + month + "-" + year;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          //snapshot.data is list
          var dataToShow=[];
          for (var i = 0; i < snapshot.data!.length; i++) {
            if(snapshot.data![i]['ApplicationStatus']=="In Process"){
              dataToShow.add(snapshot.data![i]);
            }
          }
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dataToShow.length,
            itemBuilder: (BuildContext context, int index) {
              String startDate = getDate(dataToShow[index]['LeaveStartDate']);
              String endDate = getDate(dataToShow[index]['LeaveEndDate']);
              String type = dataToShow[index]['ApplicationType'];
              String status =dataToShow[index]['ApplicationStatus'];
              String employeeID =
                  "${dataToShow[index]['ApplicantEmployeeID']}";
              int applicationID = dataToShow[index]['ApplicationNumber'];
              return Card(
                child: ListTile(
                  title: Text(startDate + " To " + endDate),
                  subtitle: Text("${employeeID} " + type),
                  trailing: SizedBox(
                    width:
                        160, // Set the desired width for the trailing section
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await approveLeave(applicationID);
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 46, 106, 238),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Approve",
                              textScaleFactor: 0.7,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 8), // Add some spacing between the buttons
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              await rejectLeave(applicationID);
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromARGB(255, 46, 106, 238),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Reject",
                              textScaleFactor: 0.7,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
