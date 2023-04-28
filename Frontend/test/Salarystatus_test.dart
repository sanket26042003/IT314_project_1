import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/salary_status.dart';
import 'package:http/http.dart' as http;



  Future<Map<String, dynamic>> fetchData(ID) async {
    var response = await http.get(
      Uri.parse("https://nicher-o3ai.onrender.com/employee/${ID}"),
    );

    return jsonDecode(response.body);
  }
void main()async {

  final data= await fetchData(1);
  group('I want to test Salary Status page', () {
    test('I want to test monthly salary', () {
      SalaryDetailColumn sd =
        SalaryDetailColumn(title: 'Monthly Salary', value: "${data['Salary']}");

      String s1 = sd.title;
      String s2 = sd.value;

      expect(s2, '1174983');
      expect(s2, isNot('120000'));
    });

    test('I want to test post', () {
      SalaryDetailColumn sd =
        SalaryDetailColumn(title: 'Post', value: data['Post']);

      String s1 = sd.title;
      String s2 = sd.value;

      expect(s2, 'Engineer');
      expect(s1, isNot('postt'));
    });
  });
}
