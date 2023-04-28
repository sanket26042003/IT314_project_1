import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/employee_profile_page.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData(ID) async {
  var response = await http.get(
    Uri.parse("https://nicher-o3ai.onrender.com/employee/${ID}"),
  );

  return jsonDecode(response.body);
}

void main()async {
  final data=await fetchData(1);
  group('I want to test profile page', () {
    
    test('I want to test Current Project name', () {
      
      ProfileDetailRow pdr =
           ProfileDetailRow(title: 'Current Project', value: data['Project']);

      String result1 = pdr.title;
      String result2 = pdr.value;
      print(pdr.value);

      expect(result2, 'P4');
      expect(result1, isNot('current pproject'));
    });

    test('I want to test ID', () {
      ProfileDetailColumn pdr =
        ProfileDetailColumn(title: 'ID', value: "${data['EmployeeID']}");

      String result1 = pdr.title;
      String result2 = pdr.value;

      expect(result2, '1');
      expect(result1, isNot('id'));
    });

    test('I want to test manager name', () {
      ProfileDetailRowD pdr =
          ProfileDetailRowD(title: 'Manager', value: data['ManagerName']);

      String result1 = pdr.title;
      String result2 = pdr.value;

      expect(result2, 'Vivaan Chandra');
      expect(result1, isNot('man'));
    });

    test('I want to test address', () {
      ProfileDetailColumnD pdr =
        ProfileDetailColumnD(title: 'Address', value: data['Address']);

      String result1 = pdr.title;
      String result2 = pdr.value;

      expect(result1, 'Address');
      expect(result2, isNot('ABC'));
    });
  });
}
