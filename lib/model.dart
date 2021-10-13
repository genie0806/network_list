import 'package:network_test/model/comments_model.dart';
import 'package:network_test/model/posts_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const postsUrl = 'https://jsonplaceholder.typicode.com/posts';
const commentsUrl = 'https://jsonplaceholder.typicode.com/comments';

Future<List<PostModel>> fetchPosts() async {
  final response = await http.get(Uri.parse(postsUrl));
  Iterable jsonResponse = convert.jsonDecode(response.body);
  List<PostModel> posts =
      jsonResponse.map((e) => PostModel.fromJson(e)).toList();
  return posts;
}

Future<List<CommentModel>> fetchComments(int postId) async {
  final response = await http.get(Uri.parse(commentsUrl + '?postId= $postId'));
  Iterable jsonResponse = convert.jsonDecode(response.body);
  List<CommentModel> comments =
      jsonResponse.map((e) => CommentModel.fromJson(e)).toList();
  return comments;
}
