class CommentModel {
  late int postId;
  late int id;
  late String name;
  late String email;
  late String body;

  CommentModel(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  CommentModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
