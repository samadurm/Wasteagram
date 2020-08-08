import 'package:flutter/material.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';
import 'package:wasteagram/widgets/post_display.dart';


class ListScreen extends StatelessWidget {
  
  static const routeName = '/';
  static final List<Post> posts = dummyPosts();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        title: Text('Wastegram'),
        usingButton: true,
        body: ListScreen.posts == null ? Center(child: CircularProgressIndicator()) : PostDisplay(posts: posts),
    );
  }
}  

List <Post> dummyPosts(){
  List <Post> posts = [];
  for(int i = 0; i < 100; i++) {
    posts.add(Post(
        imageURL: 'assets/images/stock-donuts.jpeg',
        date: DateTime.now(), 
        wastedItems: 0,
        latitude: 0.02,
        longitude: 0.04
    ));
  }
  return posts;
}