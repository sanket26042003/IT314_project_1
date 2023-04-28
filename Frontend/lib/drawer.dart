import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nicher/company_profile.dart';
import 'package:nicher/create_employee.dart';
import 'package:nicher/employee_list.dart';
import 'package:nicher/employee_profile_page.dart';
import 'package:nicher/leave_application.dart';
import 'package:nicher/leave_application_list.dart';
import 'package:nicher/leave_approval.dart';
import 'package:nicher/manager_profile_page.dart';
import 'package:nicher/manager_salary_status.dart';
import 'package:nicher/salary_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  final token;

  MyDrawer({super.key, @required this.token});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late String username;

  late String position;

  late int ID;
  @override
  void initState() {
    // TODO: implement initState
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    username = jwtDecodedToken['username'];
    position = jwtDecodedToken['position'];
    ID = jwtDecodedToken['id'];
  }

  @override
  Widget build(BuildContext context) {
    return position == "0"
        ? EmployeeDrawer(
            username: username,
            ID: ID,
            token: widget.token,
          )
        : position == "1"
            ? ManagerDrawer(
                username: username,
                ID: ID,
                token: widget.token,
              )
            : AdminDrawer(
                username: username,
                ID: ID,
                token: widget.token,
              );
  }
}

class EmployeeDrawer extends StatelessWidget {
  final username;
  final ID;
  final token;
  const EmployeeDrawer(
      {super.key,
      @required this.username,
      @required this.ID,
      @required this.token});

  Future<Map<String, dynamic>> fetchData() async {
    var response = await http.get(
      Uri.parse("https://nicher-o3ai.onrender.com/employee/${ID}"),
    );

    return jsonDecode(response.body);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(username),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIG.Zm7JwGm2K.5G5w2KJ1rr?pid=ImgGn"),
                ),
                accountEmail: null,
              ),
            ),
            ListTile(
              onTap: () async {
                Map<String, dynamic> data = await fetchData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmployeeProfilePage(data: data)));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                Map<String, dynamic> data = await fetchData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SalaryStatus(data: data)));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Salary Status",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                // Map<String, dynamic> data = await fetchData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaveApplicationList(
                              token: token,
                            )));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Leave Application",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Company Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                await logout();
                Navigator.of(context).pushReplacementNamed('/employee_login');
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminDrawer extends StatelessWidget {
  final username;
  final ID;
  final token;
  const AdminDrawer(
      {super.key,
      @required this.username,
      @required this.ID,
      @required this.token});

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(username),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIG.Zm7JwGm2K.5G5w2KJ1rr?pid=ImgGn"),
                ),
                accountEmail: null,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Company Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                await logout();
                Navigator.of(context).pushReplacementNamed('/admin_login');
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManagerDrawer extends StatelessWidget {
  final username;
  final ID;
  final token;
  const ManagerDrawer(
      {super.key,
      @required this.username,
      @required this.ID,
      @required this.token});

  Future<Map<String, dynamic>> fetchData() async {
    var response = await http.get(
      Uri.parse("https://nicher-o3ai.onrender.com/manager/${ID}"),
    );

    return jsonDecode(response.body);
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(username),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIG.Zm7JwGm2K.5G5w2KJ1rr?pid=ImgGn"),
                ),
                accountEmail: null,
              ),
            ),
            ListTile(
              onTap: () async {
                Map<String, dynamic> data = await fetchData();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManagerProfile(data: data)));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                Map<String, dynamic> data = await fetchData();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManagerSalaryStatus(
                              data: data,
                            )));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Salary Status",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaveApproval(
                              token: token,
                            )));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Approve Leave",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateEmployee(
                              ID: ID,
                            )));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Add employee",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListOfEmployee(
                              ID: ID,
                            )));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Team",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Company Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                await logout();
                Navigator.of(context).pushReplacementNamed('/manager_login');
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
