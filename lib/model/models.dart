class JsonModel {
  int userId;
  int id;
  String title;
  String body;

  JsonModel({this.userId, this.id, this.title, this.body});

  JsonModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
