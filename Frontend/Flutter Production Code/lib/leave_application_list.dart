import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:nicher/drawer.dart';
import 'package:nicher/leave_application.dart';

class LeaveApplicationList extends StatefulWidget {
  final token;
  const LeaveApplicationList({super.key, @required this.token});

  @override
  State<LeaveApplicationList> createState() => _LeaveApplicationListState();
}

class _LeaveApplicationListState extends State<LeaveApplicationList> {
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
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LeaveApplication(
                        token: widget.token,
                      )));
        },
        child: Icon(CupertinoIcons.add),
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
          return SingleChildScrollView(
            child: DesktopBody(
              ID: ID,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: DesktopBody(
              ID: ID,
            ),
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
      Uri.parse(
          "https://nicher-o3ai.onrender.com/leave/employeeleave/${widget.ID}"),
    );
    var jsonResponse = await jsonDecode(response.body);
    return jsonResponse;
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
          print(snapshot.data?.length);
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                String startDate = getDate(snapshot.data![index]['LeaveStartDate']);
                String endDate = getDate(snapshot.data![index]['LeaveEndDate']);
                String type = snapshot.data![index]['ApplicationType'];
                String status = snapshot.data![index]['ApplicationStatus'];
                return Card(
                  child: ListTile(
                    title: Text(startDate + " To " + endDate),
                    subtitle: Text(type),
                    trailing: Text(status),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
