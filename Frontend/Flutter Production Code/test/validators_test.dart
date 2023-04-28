import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nicher/validators.dart';

void main()
{
  test('I want to check start date and end date function', () {
    int result = Validators.checkDates(10, 11, 2023, 14, 11, 2023);
    expect(result, 0);
  });
}