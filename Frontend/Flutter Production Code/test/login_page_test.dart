import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/employee_login.dart';

void main() {
  test('I want to test login portal', () {
    bool emptyOrNot = validateFormField("");
    expect(emptyOrNot, true);
  });
}
