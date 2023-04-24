import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nicher/employee_login.dart';

import 'drawer.dart';

class HomePage extends StatefulWidget {
  final token;
  const HomePage({super.key, @required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32, left: 16),
                      child: InfoData(
                          position: position,
                          ID: ID,
                          username: username,
                          scale: 1),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 32, left: 50),
                      child: AttendanceButton(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: AttendanceStatusBox(
                    ID: ID,
                  ),
                )
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://th.bing.com/th/id/OIG.Zm7JwGm2K.5G5w2KJ1rr?pid=ImgGn',
                          scale: 2,
                        ),
                      ),
                      SizedBox(
                        width: 0.05 * size.width,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoData(
                              position: position,
                              ID: ID,
                              username: username,
                              scale: 2),
                          // Spacer(),
                          const AttendanceButton(),
                          const SizedBox(
                            height: 30,
                          ),
                          AttendanceStatusBox(
                            ID: ID,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

class AttendanceStatusBox extends StatefulWidget {
  final ID;
  const AttendanceStatusBox({super.key, this.ID});

  @override
  State<AttendanceStatusBox> createState() => _AttendanceStatusBoxState();
}

class _AttendanceStatusBoxState extends State<AttendanceStatusBox> {
  Future<Map<String, dynamic>> fetchData() async {
    var response = await http.get(
      Uri.parse(
          "https://nicher-o3ai.onrender.com/employee/attendance/${widget.ID}"),
    );
    var jsonResponse = await jsonDecode(response.body);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 500,
      height: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 20,
            color: Color.fromARGB(255, 218, 218, 218),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String presentDays = snapshot.data!['present'].toString();
              String absentDays = snapshot.data!['absent'].toString();
              String totalDays = snapshot.data!['total'].toString();

              return Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Attendacne",
                    style: TextStyle(color: Color.fromARGB(255, 55, 55, 55)),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              presentDays,
                              textScaleFactor: 2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text("Present")
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              absentDays,
                              textScaleFactor: 2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text("Absent")
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              totalDays,
                              textScaleFactor: 2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text("Total")
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class AttendanceButton extends StatefulWidget {
  const AttendanceButton({super.key});

  @override
  State<AttendanceButton> createState() => _AttendanceButtonState();
}

class _AttendanceButtonState extends State<AttendanceButton> {
  // Future<void> addAttendance() async {
  //   var response = await http.get(
  //     Uri.parse("http://localhost:3000/updatecnt"),
  //   );
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 100,
        child: const Center(
            child: Text(
          "Present",
          style: TextStyle(
            color: Colors.white,
          ),
        )),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 46, 106, 238),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class InfoData extends StatefulWidget {
  final String position;
  final int ID;
  final String username;
  final int scale;
  const InfoData(
      {super.key,
      required this.position,
      required this.ID,
      required this.username,
      required this.scale});

  @override
  State<InfoData> createState() => _InfoDataState();
}

class _InfoDataState extends State<InfoData> {
  @override
  Future<String> getJobDescription() async {
    final employeeID = widget.ID;
    var response = await http.get(
      Uri.parse("https://nicher-o3ai.onrender.com/employee/${employeeID}"),
    );

    var jsonResponse = jsonDecode(response.body);
    return jsonResponse['Post'];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey, ${widget.username}",
          textScaleFactor: 2.0 * widget.scale,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        FutureBuilder<String>(
          future: getJobDescription(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while waiting for the data.
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Display an error message if there's an error.
            } else {
              return Text(
                snapshot.data!,
                textScaleFactor: 1.0 * widget.scale,
              ); // Display the fetched data once it's available.
            }
          },
        ),
        Text(
          "${widget.ID}",
          textScaleFactor: 1.0 * widget.scale,
        )
      ],
    );
  }
}
