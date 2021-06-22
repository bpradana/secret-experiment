import 'package:flutter/material.dart';
import 'package:secret_experiment/model/post_model.dart';
import 'package:secret_experiment/page/PostPage.dart';
import 'package:secret_experiment/widget/card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DeepTalk'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PostPage()));
          },
          label: Text('Post'),
          icon: const Icon(Icons.add),
        ),
        body: Container(
          child: Card(
              child: FutureBuilder(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return PostCard(snapshot.data[i].name,
                        snapshot.data[i].content, snapshot.data[i].created);
                  },
                );
            },
          )),
        ));
  }
}
