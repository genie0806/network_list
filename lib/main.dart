import 'package:flutter/material.dart';
import 'package:network_test/page/post_page.dart';

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
      home: const PostTilePage(),
    );
  }
}
