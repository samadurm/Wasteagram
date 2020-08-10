import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/screens/detail_screen.dart';


// class PostDisplay extends StatelessWidget {
  
//   final List<Post> posts;

//   PostDisplay({this.posts});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('${DateFormat('EEEE, MMM d, yyyy').format(posts[index].date)}'),
//           trailing: Text('${posts[index].wastedItems}', textScaleFactor: 1.3,),
//           onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: posts[index])
//         );
//       }
//     );
//   }
// }

class PostDisplay extends StatefulWidget {
  
  final List<Post> posts;

  PostDisplay({this.posts});
  
  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('mock-posts').snapshots(),
      builder: (context, snapshot){
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            var post = snapshot.data.documents[index];
            return ListTile(
              // ${DateFormat('EEEE, MMM d, yyyy').format(posts[index].date)
              title: Text(post['date'].toString()),
              trailing: Text(post['wastedItems'].toString(), textScaleFactor: 1.3,),
              // onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: posts[index])
            );
          }
        );
      },
    );
  }
}