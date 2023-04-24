import 'package:flutter/material.dart';

import 'models/profile.dart';

class ProfilePageM extends StatelessWidget {
  const ProfilePageM({super.key});

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
            return const MobileBody();
          } else {
            return const DesktopBody();
          }
        },
      ),
    );
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

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
                  backgroundImage: NetworkImage(MyProfile.profiles[0].image),
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
                      MyProfile.profiles[0].EmployeeName,
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
                    const Text(
                      'Username',
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
                  ProfileDetailRowD(
                      title: 'Department',
                      value: MyProfile.profiles[0].Department),
                  ProfileDetailRowD(
                      title: 'Current Project',
                      value: MyProfile.profiles[0].currentProject),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileDetailRowD(
                      title: 'Gender', value: MyProfile.profiles[0].Gender),
                  ProfileDetailRowD(
                      title: 'Joining Year',
                      value: MyProfile.profiles[0].DateOfJoining),
                ],
              ),
              const SizedBox(
                height: 30,
                width: 30,
              ),
              ProfileDetailColumnD(
                  title: 'ID', value: MyProfile.profiles[0].EmployeeID),
              ProfileDetailColumnD(
                  title: 'Email', value: MyProfile.profiles[0].Email),
              ProfileDetailColumnD(
                  title: 'Phone number', value: MyProfile.profiles[0].PhoneNo),
              ProfileDetailColumnD(
                  title: 'Address', value: MyProfile.profiles[0].Address)
            ],
          ),
        ],
      ),
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

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
                  backgroundImage: NetworkImage(MyProfile.profiles[0].image),
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
                      MyProfile.profiles[0].EmployeeName,
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
                      'Username',
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
              ProfileDetailRow(
                  title: 'Department', value: MyProfile.profiles[0].Department),
              ProfileDetailRow(
                  title: 'Current Project',
                  value: MyProfile.profiles[0].currentProject),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileDetailRow(
                  title: 'Gender', value: MyProfile.profiles[0].Gender),
              ProfileDetailRow(
                  title: 'Joining Year',
                  value: MyProfile.profiles[0].DateOfJoining),
            ],
          ),
          const SizedBox(
            height: 10,
            width: 10,
          ),
          ProfileDetailColumn(
              title: 'ID', value: MyProfile.profiles[0].EmployeeID),
          ProfileDetailColumn(
              title: 'Email', value: MyProfile.profiles[0].Email),
          ProfileDetailColumn(
              title: 'Phone number', value: MyProfile.profiles[0].PhoneNo),
          ProfileDetailColumn(
              title: 'Address', value: MyProfile.profiles[0].Address)
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
                width: MediaQuery.of(context).size.width / 1.1,
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