import 'package:network_test/model/comment_Model.dart';
import 'package:network_test/model/post_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const postsUrl = 'https://jsonplaceholder.typicode.com/posts';
const commentsUrl = 'https://jsonplaceholder.typicode.com/comments';

Future<List<PostModel>> fetchPosts() async {
  final response = await http.get(postsUrl);
  Iterable jsonResponse = convert.jsonDecode(response.body);
  List<PostModel> posts =
      jsonResponse.map((e) => PostModel.fromJson(e)).toList();
  return posts;
}

Future<List<CommentModel>> fetchComments(int postId) async {
  final response = await http.get(commentsUrl + '?postId=$postId');
  Iterable jsonResponse = convert.jsonDecode(response.body);
  List<CommentModel> comments =
      jsonResponse.map((e) => CommentModel.fromJson(e)).toList();
  return comments;
}