import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FoodWasteSubmission{
  int wastedItems;
  File image;
  String imageURL;
  DateTime date;
  double latitude;
  double longitude;
}

class NewPost extends StatefulWidget {
  
  final File image;
  NewPost({this.image});

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {

  final _formKey = GlobalKey<FormState>();
  FoodWasteSubmission _newWastePost = FoodWasteSubmission();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.file(widget.image),
        ),
        Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: 'Number of Wasted Items'),
              keyboardType: TextInputType.number,
              validator: (value){
                return value.isEmpty ? 'Enter Number of Wasted Items' : null;
              },
              onSaved: (numWasted) { 
                _newWastePost.wastedItems = int.parse(numWasted); 
              }
            ),
            RaisedButton(
              child: Icon(Icons.cloud_upload), 
              onPressed: () { 

                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();

                  _newWastePost.image = widget.image;
                  _newWastePost.date = DateTime.now();
                  _newWastePost.latitude = 0.08;
                  _newWastePost.longitude = 0.01;
                  
                  saveToCloud(_newWastePost, 'mock-posts');
                  Navigator.of(context).pop();
                }
              } 
            )
          ],
          )
        )
      ],
    );
  }
}

void saveToCloud(FoodWasteSubmission newWastePost, String collectionName){
  Firestore.instance.collection(collectionName).add({
    'wastedItems': newWastePost.wastedItems,
    'date': newWastePost.date,
    'latitude': newWastePost.latitude,
    'longitude': newWastePost.longitude
  });
}