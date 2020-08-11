import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FoodWasteSubmission{
  int wastedItems;
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
                  Future <String> uploadedUrl = uploadImage(widget.image);

                  uploadedUrl.then((url) {
                    _newWastePost.imageURL = url;
                    _newWastePost.date = DateTime.now();
                    _newWastePost.latitude = 0.08;
                    _newWastePost.longitude = 0.01;

                    saveToCloud(_newWastePost, 'mock-posts');
                  });
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

Future<String> uploadImage(File image) async {
  String filename = 'photo-${Random().nextInt(10000)}-${DateTime.now()}.jpg';
  StorageReference storageRef = FirebaseStorage.instance.ref().child(filename);

  StorageUploadTask upload = storageRef.putFile(image);
  await upload.onComplete;
  return await storageRef.getDownloadURL();
}

void saveToCloud(FoodWasteSubmission newWastePost, String collectionName){
  
  
  
  Firestore.instance.collection(collectionName).add({
    'imageUrl': newWastePost.imageURL,
    'wastedItems': newWastePost.wastedItems,
    'date': newWastePost.date,
    'latitude': newWastePost.latitude,
    'longitude': newWastePost.longitude
  });
}