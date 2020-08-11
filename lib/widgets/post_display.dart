import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/post.dart';
import 'package:wasteagram/screens/detail_screen.dart';


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
        
        if (!snapshot.hasData) return CircularProgressIndicator();
        else if(snapshot.hasError) return Center(child: Text('Error!'),);
                
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){

            var post = snapshot.data.documents[index];
            Post _wastePost = parseData(
              post['date'].toDate(), 
              post['wastedItems'], 
              post['latitude'], 
              post['longitude'] 
            );

            return ListTile(
              title: Text(DateFormat('EEEE, MMM d, yyyy').format(_wastePost.date)),
              trailing: Text(_wastePost.wastedItems.toString(), textScaleFactor: 1.3,),
              onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: _wastePost)
            );
          }
        );
      },
    );
  }
}

Post parseData(DateTime date, int wastedItems, double latitude, double longitude){
  return Post(
    date: date, 
    wastedItems: wastedItems, 
    latitude: latitude, 
    longitude: longitude
  );
}  