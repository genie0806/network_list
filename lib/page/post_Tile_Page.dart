import 'package:flutter/material.dart';
import 'package:network_test/api_Model.dart';
import 'package:network_test/model/post_Model.dart';
import 'package:network_test/page/comment_Tile_Page.dart';
import 'package:network_test/widget/list_Tile.dart';

class PostTilePage extends StatefulWidget {
  const PostTilePage({Key key}) : super(key: key);

  @override
  _PostTilePageState createState() => _PostTilePageState();
}

class _PostTilePageState extends State<PostTilePage> {
  List<PostModel> postList = [];

  @override
  void initState() {
    super.initState();
    initPosts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initPosts() async {
    List<PostModel> posts = await fetchPosts();
    setState(() {
      postList = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이제 좀 알거같은 Json'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (postList.isNotEmpty)
              ...postList.map((e) {
                return ListTileForm(
                  id: '${e.id}',
                  title: e.title,
                  userId: '${e.userId}',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentTilePage(postModel: e),
                      ),
                    );
                  },
                );
              }).toList()
            else
              Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
          ],
        ),
      ),
    );
  }
}
