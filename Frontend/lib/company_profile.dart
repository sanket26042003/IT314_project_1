import 'package:flutter/material.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 106, 238),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 106, 238),
        elevation: 0.0,
        title: const Text(
          "nicher SaaS",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 46, 106, 238),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(50, 0),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.elliptical(50, 0))),
              child: Image.asset(
                "assets/nicherSaaS_1.jpg",
                //fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
              width: 30,
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              width: double.infinity,
              child: const Text(
                'About Us',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              width: double.infinity,
              child: const Text(
                'nicher SaaS provides interface for managing all the employee details.',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
