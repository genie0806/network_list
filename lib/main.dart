// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:network_test/home_page.dart';

void main() {
  runApp(const TestJson());
}

class TestJson extends StatelessWidget {
  const TestJson({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
