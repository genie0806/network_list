import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_test/comments.dart';
import 'dart:convert' as convert;

import 'package:network_test/model/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String listTitle = '';
  int listId;
  var userWidget = <Widget>[];

  @override
  void initState() {
    super.initState();
    user();
  }

  user() async {
    List<JsonModel> postList = await fetchList();
    List<Widget> widgets = [];
    postList
        .map(
          (e) => widgets.add(
            ListTile(
              // 리스트 타일로 하나씩 뿌려주기.
              leading: Text(e.id.toString()), //리스트 타일 Leading에 json의 Id import
              title: Text(e.title), //리스트타일 title에 title 넣기
              subtitle: Text(
                '작성자' + e.userId.toString(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Comment(),
                  ),
                );
              },
            ),
          ),
        )
        .toString();

    setState(() => this.userWidget = widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json은 어렵다.'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: userWidget),
        ),
      ),
    );
  }
}

Future<List<JsonModel>> fetchList() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');
  Iterable jsonresponse = convert.jsonDecode(response.body);
  List<JsonModel> postList =
      jsonresponse.map((e) => JsonModel.fromJson(e)).toList();
  return postList;
}
