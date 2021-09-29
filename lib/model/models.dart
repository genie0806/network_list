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

class Json2Model {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Json2Model({this.postId, this.id, this.name, this.email, this.body});

  Json2Model.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}
