import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';


class PostDisplay extends StatefulWidget {
  
  @override
  _PostDisplayState createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('mock-posts').snapshots(),
      builder: (context, snapshot){
        
        if (!snapshot.hasData || snapshot.data.documents.length == 0) 
          return Center(child: CircularProgressIndicator());
        else if(snapshot.hasError) 
          return Center(child: Text('Error!'),);
                
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){

            var post = snapshot.data.documents[index];
            FoodWastePost _wastePost = parseData(
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

FoodWastePost parseData(DateTime date, int wastedItems, double latitude, double longitude){
  return FoodWastePost(
    date: date, 
    wastedItems: wastedItems, 
    latitude: latitude, 
    longitude: longitude
  );
}  