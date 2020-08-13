import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';
import 'package:wasteagram/screens/detail_screen.dart';


class ListScreen extends StatelessWidget {
  
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        title: Text('Wastegram'),
        usingButton: true,
        body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
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
                post['imageUrl'], 
                post['wastedItems'], 
                post['latitude'], 
                post['longitude'] 
              );

              return Semantics(
                child: ListTile(
                  title: Text(_wastePost.getReadableDate()),
                  trailing: Text(_wastePost.wastedItems.toString(), textScaleFactor: 1.3,),
                  onTap: () => Navigator.pushNamed(context, DetailScreen.routeName, arguments: _wastePost)
                ),
                enabled: true,
                onTapHint: 'View details of post on ${_wastePost.getReadableDate()}',
              );
            }
          );
        },
      ),
    );
  }
}  

FoodWastePost parseData(DateTime date, String imageUrl, int wastedItems, double latitude, double longitude){
  return FoodWastePost(
    date: date, 
    imageURL: imageUrl,
    wastedItems: wastedItems, 
    latitude: latitude, 
    longitude: longitude
  );
}  