import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Welcome"),
      // ),
      // drawer: Drawer(),
      body: Center(
        child: Container(
          //duration: const Duration(seconds: 1),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white), //Color.fromARGB(255, 2, 1, 22)),
          //color: Colors.lightBlue,
          // child: Center(
          //   child: const Text(
          //     "Logo Page",
          //     style: TextStyle(
          //         fontSize: 30,
          //         fontWeight: FontWeight.bold,
          //         color: Color.fromARGB(255, 0, 0, 0)),
          //   ),
          // ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // InkWell(
              //   onTap: () async{
              //     await Future.delayed(const Duration(seconds: 1));
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              // ),

              Image.asset(
                "assets/nicherSaaS_1.jpg",
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
