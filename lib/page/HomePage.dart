import 'package:flutter/material.dart';
import 'package:secret_experiment/model/post_model.dart';

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
                    return ListTile(
                      title: Text(snapshot.data[i].content),
                      subtitle: Text(snapshot.data[i].name),
                    );
                  },
                );
            },
          )),
        ));
  }
}
