import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test happy scenario', () {
    String input = "http://domain/token/{token}/id/{id}";
    Map<String, dynamic> map = {'token': '123', 'id': 'test'};
    String res = resolveUrlTemplate(input, map);

    expect(res, "http://domain/token/123/id/test");
  });

  test('test empty map', () {
    String input = "http://domain/token/{token}/id/{id}";
    Map<String, dynamic> map = {};
    String res = resolveUrlTemplate(input, map);

    expect(res, "http://domain/token//id/");
  });

  test("test one missed entry", () {
    String input = "http://domain/token/{token}/id/{id}";
    Map<String, dynamic> map = {'token': '123'};
    String res = resolveUrlTemplate(input, map);

    expect(res, "http://domain/token/123/id/{id}");
  });
}

/**
 * input like http://domain/token/{token}/id/{id}
 */
String resolveUrlTemplate(String input, Map<String, dynamic> mapValues) {
  // RegExp regExp = RegExp(r'.*\{[A-Z][a-z]{1-10}}.*');
  input = input.replaceFirst("{token}", mapValues['token'] ?? (mapValues.isEmpty ? "" : "{token}") );
  input = input.replaceFirst("{id}", mapValues['id'] ?? (mapValues.isEmpty ? "" : "{id}" ));
  return input;
}

bool testRegex(String input) {
  RegExp regExp = RegExp(r'.*\{[A-Z][a-z].*}.*');
  return regExp.hasMatch(input);
}
