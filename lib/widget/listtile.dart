import 'package:flutter/material.dart';

class ListTileForm extends StatelessWidget {
  final String id;
  final String title;
  final String userId;
  final Function() onTap;

  const ListTileForm(
      {Key? key,
      required this.id,
      required this.title,
      required this.userId,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(id),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('작성자$userId'),
      onTap: onTap,
    );
  }
}
