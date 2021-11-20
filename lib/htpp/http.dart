import 'package:flutter/material.dart';
import 'package:http/http.dart';

void findAll() async {
  final url = Uri.parse('http://192.168.15.47:8080/transactions');
  final Response response = await get(url);
  debugPrint('I1m he5re');
  debugPrint(response.body);
}
