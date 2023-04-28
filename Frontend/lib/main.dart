import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nicher/admin_login.dart';
import 'package:nicher/company_profile.dart';
import 'package:nicher/employee_login.dart';
import 'package:nicher/employee_register.dart';
import 'package:nicher/home_page.dart';
import 'package:nicher/logo_page.dart';
import 'package:nicher/manager_login.dart';
import 'package:nicher/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(
//         token: prefs.getString('token'),
//       ), // Wrap your app
//     ),
//   );
// }
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs=await SharedPreferences.getInstance();
  runApp(MyApp(token:prefs.getString('token')));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({super.key, @required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'nicher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryColor: const Color.fromARGB(255, 255, 0, 0),
          canvasColor: const Color.fromARGB(255, 46, 106, 238),
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      routes: {
        "/": (context) => LogoPage(
              token: token != null && !JwtDecoder.isExpired(token)
                  ? token
                  : "notoken",
            ),
        "/welcome_page": (context) => const WelcomePage(),
        "/employee_login": (context) => const EmployeeLogin(),
        "/manager_login": (context) => const ManagerLogin(),
        "/admin_login": (context) => const AdminLogin(),
        "/employee_register": (context) => const EmployeeRegister(),
        "/company_profile": (context) => const CompanyProfile()
        // "/home_page":(context) => const HomePage(token: token)
      },
    );
  }
}
