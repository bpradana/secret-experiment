import 'package:flutter/material.dart';
import 'package:secret_experiment/model/post_model.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _controller = TextEditingController();
  Future _futurePost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF111111),
        appBar: buildAppBar(context),
        body: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.fromLTRB(24,20,24,80),
            color: Color(0xFF3A3A3A),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: (_futurePost == null) ? buildColumn() : buildFutureBuilder(),
        )));
  }
  
  Column buildColumn() {
    return Column(
      
     children: [
        TextField(
          
          keyboardType: TextInputType.multiline,
          maxLines: 36,
          style: TextStyle(color: Color(0xFFEAEAEA)),
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Write your sambatan',
            hintStyle: TextStyle(
              color: Color(0xFFCECECE),
            )
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _futurePost = createPost(_controller.text);
              });
            },
            child: Text('Post!'))
      ]
    );
  }

  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      future: _futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.push(
                context, MaterialPageRoute(builder: (context) => PostPage()));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
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

// class PostPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post Page'),
//       ),
//       body: Container(
//         child: Center(
//           child: Image.network(
//               'https://media.giphy.com/media/Ju7l5y9osyymQ/giphy-downsized.gif'),
//         ),
//       ),
//     );
//   }
// }
