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
        
        appBar: buildAppBar(context),
        backgroundColor: Color(0xff131418),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PostPage()));
          },
          label: Text('Post'),
          icon: const Icon(Icons.add),
          backgroundColor: Color(0xFF00AEEF),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(24,20,24,80),
          
          child: Container(
            color: Colors.transparent,
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

  Widget buildAppBar(BuildContext context) {
    return AppBar(  
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextButton.icon(
            icon: ImageIcon(
              AssetImage('assets/icons/icon_logo.png'),
              size: 32,
            ),
            label: Text(
              'deepTalk',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                color: Color(0xFFEAEAEA),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            onPressed: () {
              print('Pressed');
            }
          )
        );
  }
  
}
