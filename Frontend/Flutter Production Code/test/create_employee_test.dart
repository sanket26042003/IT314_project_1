import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/create_employee.dart';

void main() {
  test('I want to test create employee field', () {
    bool emptyOrNot = validateFormField("");
    expect(emptyOrNot, true);
  });
}
