import 'package:flutter/material.dart';
import 'package:network_test/model.dart';
import 'package:network_test/model/comments_model.dart';
import 'package:network_test/model/posts_model.dart';
import 'package:network_test/widget/listtile.dart';

class CommentTilePage extends StatefulWidget {
  final PostModel postModel;

  const CommentTilePage({Key? key, required this.postModel}) : super(key: key);

  @override
  _CommentTilePageState createState() => _CommentTilePageState();
}

class _CommentTilePageState extends State<CommentTilePage> {
  List<CommentModel> commentList = [];

  @override
  void initState() {
    super.initState();
    initComment();
  }

  void initComment() async {
    List<CommentModel> comments = await fetchComments(widget.postModel.id);
    setState(() {
      commentList = comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('진짜로 알거같은 Json'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (commentList.isNotEmpty)
              ...commentList.map((e) {
                return ListTileForm(
                  id: '${e.id}',
                  title: e.name,
                  userId: e.body,
                  onTap: () {},
                );
              }).toList()
            else
              const Padding(
                padding: EdgeInsets.only(top: 320),
                child: Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
