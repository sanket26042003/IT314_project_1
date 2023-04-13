import 'package:flutter/material.dart';

import 'models/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: Container(
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
                        MyProfile.profiles[0].roll,
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
                    title: 'Department',
                    value: MyProfile.profiles[0].Department),
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
                    title: 'Manager', value: MyProfile.profiles[0].Manager),
                ProfileDetailRow(
                    title: 'Post', value: MyProfile.profiles[0].Post),
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
