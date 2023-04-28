import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'package:nicher/drawer.dart';
import 'package:nicher/employee_profile_page.dart';

class ListOfEmployee extends StatefulWidget {
  final ID;
  const ListOfEmployee({super.key, @required this.ID});

  @override
  State<ListOfEmployee> createState() => _ListOfEmployeeState();
}

class _ListOfEmployeeState extends State<ListOfEmployee> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // drawer: MyDrawer(
      //   token: widget.token,
      // ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        title: const Text(
          "nicher",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          )
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return DesktopBody(
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
  final int ID;
  const DesktopBody({super.key, required this.ID});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  Future<List<dynamic>> fetchData() async {
    var response = await http.get(
      Uri.parse(
          "https://nicher-o3ai.onrender.com/manager/employeemanager/${widget.ID}"),
    );
    var jsonResponse = await jsonDecode(response.body);
    return jsonResponse;
  }

  Future<Map<String, dynamic>> fetchProfileData(int employeeID) async {
    var response = await http.get(
      Uri.parse("https://nicher-o3ai.onrender.com/employee/${employeeID}"),
    );

    return jsonDecode(response.body);
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

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              String EmployeeName = snapshot.data![index]['EmployeeName'];
              String Post = snapshot.data![index]['Post'];
              int EmployeeID = snapshot.data![index]['EmployeeID'];
              return Card(
                child: ListTile(
                  title: Text(EmployeeName),
                  subtitle: Text("Post: " + Post),
                  trailing:
                      // Set the desired width for the trailing section

                      // Add some spacing between the buttons
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> data =
                              await fetchProfileData(EmployeeID);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployeeProfilePage(
                                        data: data,
                                      )));
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
                          "View More",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
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
