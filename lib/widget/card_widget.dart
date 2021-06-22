import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard(this.name, this.content, this.created);

  final String name;
  final String content;
  final String created;

  // Change this vin
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(content),
        subtitle:
            Text(name + '\n' + DateTime.parse(created).toLocal().toString()));
  }
}
