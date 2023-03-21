import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nicher/employee_login.dart';
import 'package:nicher/employee_register.dart';
import 'package:nicher/logo_page.dart';
import 'package:nicher/welcome_page.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'nicher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryColor: const Color.fromARGB(255, 255, 0, 0),
          canvasColor: const Color.fromARGB(255, 46, 106, 238),
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      routes: {
        "/": (context) => const WelcomePage(),
        "/welcome_page": (context) => const WelcomePage(),
        "/employee_login":(context)=>const EmployeeLogin(),
        "/employee_register":(context) => const EmployeeRegister()
      },
    );
  }
}
