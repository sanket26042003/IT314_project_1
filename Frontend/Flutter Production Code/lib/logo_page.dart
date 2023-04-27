import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nicher/home_page.dart';
import 'dart:async';

import 'package:nicher/welcome_page.dart';

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(seconds: 1);
}
// class LogoPage extends StatelessWidget {
//   final token;
//   const LogoPage({super.key, this.token});
  

//   @override
//   Widget build(BuildContext context) {
//     Timer(
//             Duration(seconds: 5),
//                 () =>
//             Navigator.of(context).pushReplacement(MyRoute(
//                 builder: (BuildContext context) => token!="notoken"? HomePage(token: token) : WelcomePage())));

//     return Scaffold(  
//       body: Center(child: Image.network("https://t3.ftcdn.net/jpg/04/06/92/60/360_F_406926005_dGy1iIhhadwEGOTFJjw2q1ir7lrYjg3C.jpg")),
//     );
//   }
// }

class LogoPage extends StatefulWidget {
  final token;
  const LogoPage({super.key, this.token});

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MyRoute(
          builder: (BuildContext context) =>
              widget.token != "notoken" ? HomePage(token: widget.token) : WelcomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
              "assets/logo.jpg")),
    );
  }
}

// https://drive.google.com/file/d/1jctYyjOkdw-luLNkBkrQ8PfxRM87XKBT/view?ts=644a608e

//https://t3.ftcdn.net/jpg/04/06/92/60/360_F_406926005_dGy1iIhhadwEGOTFJjw2q1ir7lrYjg3C.jpg