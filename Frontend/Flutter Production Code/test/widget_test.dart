import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/main.dart';
import 'package:nicher/profile_page.dart';

// void main() {

//   test('Test HTTP client', () async {
//     final client = MockHttpClient((request) async {
//       final response = http.Response('{"title": "Test"}', 200);
//       return response;
//     });

//     final response = await client.get(Uri.parse('http://example.com'));
//     expect(response.statusCode, 200);
//   });
//   testWidgets('Profile page testing !!', (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(
//       home: ProfilePage(),
//     ));

//      expect(find.text('My Profile'), findsOneWidget);
//   });
// }

// void main() {
//   group('ProfilePage', () {
//     testWidgets('renders profile details correctly', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: ProfilePage(),
//         ),
//       );

//       expect(find.text('My Profile'), findsOneWidget);
//     }
//     );
//   }
//   );
// }

void main() {
  testWidgets('Mterial App Testing !!', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp),
        findsOneWidget); // MaterialApp is supposed to be only one in entire application
  });

  testWidgets('Profile Page Testing !!', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

    //expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('My Profile'), findsOneWidget);
  });
}
