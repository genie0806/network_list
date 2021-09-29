import 'package:flutter/material.dart';
import 'package:network_test/model/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Comment extends StatefulWidget {
  final int id;
  final String email;
  final String name;
  const Comment({Key key, String this.email, int this.id, String this.name})
      : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<Json2Model> commentList;
  var commentWidget = <Widget>[];

  @override
  void initState() {
    super.initState();
    usercomment();
  }

  usercomment() async {
    List<Json2Model> commentList = await fetchcommentList();
    List<Widget> widgets = [];
    commentList
        .map(
          (e) => widgets.add(
            ListTile(
              // 리스트 타일로 하나씩 뿌려주기.
              leading: Text(
                  '작성자' + e.id.toString()), //리스트 타일 Leading에 json의 Id import
              title: Text(e.name), //리스트타일 title에 title 넣기
              subtitle: Text(
                e.email,
              ),
              onTap: () {
                commentList.where((e) => e.postId != 1).toList();
              },
            ),
          ),
        )
        .toString();

    setState(() => this.commentWidget = widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('json은 어렵다'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: commentWidget,
        ),
      ),
    );
  }
}

Future<List<Json2Model>> fetchcommentList() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/comments');
  Iterable jsonresponse = convert.jsonDecode(response.body);
  List<Json2Model> commentList =
      jsonresponse.map((e) => Json2Model.fromJson(e)).toList();
  return commentList;
}
