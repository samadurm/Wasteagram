import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/screens/detail_screen.dart';


class PostDisplay extends StatelessWidget {
  
  final List<Post> posts;

  PostDisplay({this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${DateFormat('EEEE, MMM d, yyyy').format(posts[index].date)}'),
          trailing: Text('${posts[index].wastedItems}', textScaleFactor: 1.3,),
          onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: posts[index])
        );
      }
    );
  }
}