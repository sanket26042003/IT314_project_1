import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatelessWidget {
  final Map<String, dynamic> data;
  const EmployeeProfilePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 106, 238),
        elevation: 0.0,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SingleChildScrollView(
                child: MobileBody(
              data: data,
            ));
          } else {
            return SingleChildScrollView(
                child: DesktopBody(
              data: data,
            ));
          }
        },
      ),
    );
  }
}

class DesktopBody extends StatelessWidget {
  final Map<String, dynamic> data;
  const DesktopBody({super.key, required this.data});

  String getDate(String date) {
    date = date.substring(0, 10);
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String dd = date.substring(8, 10);
    return dd + "-" + month + "-" + year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //itemCount: MyProfile.items.length,
      color: Colors.white,
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(20.0)),
          Container(
            //padding: const EdgeInsets.only(right: 20, top: 20),
            height: 620,
            width: MediaQuery.of(context).size.width / 3,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 46, 106, 238),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 150,
                  minRadius: 150,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIG.Zm7JwGm2K.5G5w2KJ1rr?pid=ImgGn"),
                  //backgroundImage: AssetImage('assets/nicherSaaS_1.jpg'),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['EmployeeName'],
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.3),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 5,
                    ),
                    Text(
                      data['UserName'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
            width: 30,
          ),
          Column(
            children: [
              const SizedBox(
                height: 30,
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileDetailRowD(title: 'Department', value: data['DepartmentName']),
                  ProfileDetailRowD(
                      title: 'Current Project', value: data['Project']),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileDetailRowD(
                      title: 'Manager', value: data['ManagerName']),
                  ProfileDetailRowD(title: 'Post', value: data['Post']),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileDetailRowD(title: 'Gender', value: data['Gender']),
                  ProfileDetailRowD(
                      title: 'Date of Joining',
                      value: getDate(data['DateOfJoining'])),
                ],
              ),
              const SizedBox(
                height: 30,
                width: 30,
              ),
              ProfileDetailColumnD(title: 'ID', value: "${data['EmployeeID']}"),
              ProfileDetailColumnD(title: 'Email', value: data['Email']),
              ProfileDetailColumnD(
                  title: 'Phone number', value: data['PhoneNo']),
              ProfileDetailColumnD(title: 'Address', value: data['Address'])
            ],
          ),
        ],
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  final Map<String, dynamic> data;
  const MobileBody({super.key, required this.data});
  String getDate(String date) {
    date = date.substring(0, 10);
    String year = date.substring(0, 4);
    String month = date.substring(5, 7);
    String dd = date.substring(8, 10);
    return dd + "-" + month + "-" + year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //itemCount: MyProfile.items.length,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 46, 106, 238),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  minRadius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIG.Zm7JwGm2K.5G5w2KJ1rr?pid=ImgGn"),
                  //backgroundImage: AssetImage('assets/nicherSaaS_1.jpg'),
                ),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['EmployeeName'],
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 5,
                    ),
                    Text(
                      data['UserName'],
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDetailRow(title: 'Department', value: data['DepartmentName']),
              ProfileDetailRow(
                  title: 'Current Project', value: data['Project']),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDetailRow(title: 'Manager', value: data['ManagerName']),
              ProfileDetailRow(title: 'Post', value: data['Post']),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDetailRow(title: 'Gender', value: data['Gender']),
              ProfileDetailRow(
                  title: 'Date of joining', value: getDate(data['DateOfJoining'])),
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          ProfileDetailColumn(title: 'ID', value: "${data['EmployeeID']}"),
          ProfileDetailColumn(title: 'Email', value: data['Email']),
          ProfileDetailColumn(title: 'Phone number', value: data['PhoneNo']),
          ProfileDetailColumn(
              title: 'Address',
              value:
                  data['Address'])
        ],
      ),
    );
  }
}

class ProfileDetailRowD extends StatelessWidget {
  const ProfileDetailRowD(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 47, top: 20),
      width: MediaQuery.of(context).size.width / 4,
      //color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 138, 137, 137)),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileDetailColumnD extends StatelessWidget {
  const ProfileDetailColumnD(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 50, left: 70, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 138, 137, 137)),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.2,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
      width: MediaQuery.of(context).size.width / 2,
      //color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 138, 137, 137)),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 7,
                width: 7,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 138, 137, 137)),
                ),
                const SizedBox(
                  height: 7,
                  width: 7,
                ),
                Text(
                  value,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                  width: 7,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: const Divider(
                    thickness: 1.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
