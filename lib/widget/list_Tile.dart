import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ListTileForm extends StatelessWidget {
  final String id;
  final String title;
  final String userId;
  final Function() onTap;

  const ListTileForm({Key key, this.id, this.title, this.userId, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${id}'),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('작성자$userId'),
      onTap: onTap,
    );
  }
}
