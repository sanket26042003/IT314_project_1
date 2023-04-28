import 'package:flutter/material.dart';


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
                    backgroundImage: NetworkImage('https://th.bing.com/th/id/OIG.d2HpjcWDgHWsnZ4ZjlLe?pid=ImgGn'),
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
                        "Arnish Satasiya",
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
                        "SDE",
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
                    value: "1"),
                ProfileDetailRow(
                    title: 'Current Project',
                    value: "it314"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailRow(
                    title: 'Manager', value: "saurabh tiwari"),
                ProfileDetailRow(
                    title: 'Post', value: "GR"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailRow(
                    title: 'Gender', value: "male"),
                ProfileDetailRow(
                    title: 'Joining Year',
                    value: "2022"),
              ],
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            ProfileDetailColumn(
                title: 'ID', value: "202001031"),
            ProfileDetailColumn(
                title: 'Email', value: "arnish@gmail.com"),
            ProfileDetailColumn(
                title: 'Phone number', value: "2222222222"),
            ProfileDetailColumn(
                title: 'Address', value: "abc")
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
