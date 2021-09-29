import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    List<JsonModel> todList = await fetchList();
    List<Widget> widgets = [];
    todList
        .map((e) => widgets.add(ListTile(
              title: Text(e.id.toString()),
              subtitle: Text(e.title),
            )))
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
  List<JsonModel> todList =
      jsonresponse.map((e) => JsonModel.fromJson(e)).toList();
  print(todList[0].title);
  return todList;
}
