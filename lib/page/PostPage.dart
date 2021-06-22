import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Page'),
      ),
      body: Container(
        child: Center(
          child: Image.network(
              'https://media.giphy.com/media/Ju7l5y9osyymQ/giphy-downsized.gif'),
        ),
      ),
    );
  }
}
