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
        appBar: AppBar(
          title: Text('Post Page'),
        ),
        body: Container(
            child: Center(
          child: (_futurePost == null) ? buildColumn() : buildFutureBuilder(),
        )));
  }

  Column buildColumn() {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Write your sambatan',
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _futurePost = createPost(_controller.text);
              });
            },
            child: Text('Post!'))
      ],
    );
  }

  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      future: _futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.content);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
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
