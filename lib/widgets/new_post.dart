import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';


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
  LocationData locationData;

  void getLocation() async {
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();

    if(!serviceEnabled){
      serviceEnabled = await location.serviceEnabled();
    }
    if(!serviceEnabled){
      print('Could not enable service');
      locationData = null;
      return;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    try {
      if(permissionGranted == PermissionStatus.denied){
        permissionGranted = await location.requestPermission();
        if(permissionGranted != PermissionStatus.granted){
          print('User declined location service');
        }
      }
      locationData = await location.getLocation();
    } on PlatformException catch (e) {
        print('Error: ${e.toString()}, code: ${e.code}');
    }
    locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Semantics(
            child: Image.file(widget.image),
            enabled: true,
            image: true,
            label: 'Image just taken for new post',
          )
        ),
        Form(
          key: _formKey,
          child: Column(children: [
            Semantics(
              enabled: true,
              textField: true,
              onTapHint: 'Enter number of wasted items',
              child: TextFormField(
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
            ),
            Semantics(
              enabled: true,
              button: true,
              onTapHint: 'Submit Post',
              child: RaisedButton(
                child: Icon(Icons.cloud_upload), 
                onPressed: () { 

                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    getLocation();

                    Future <String> uploadedUrl = uploadImage(widget.image);
                    uploadedUrl.then((url) {
                      _newWastePost.imageURL = url;
                      _newWastePost.date = DateTime.now();

                      if(locationData != null){
                        _newWastePost.latitude = locationData.latitude;
                        _newWastePost.longitude = locationData.longitude;
                      } else {
                        _newWastePost.latitude = 0;
                        _newWastePost.longitude = 0;
                      }
                      saveToCloud(_newWastePost, 'posts');
                    });
                    Navigator.of(context).pop();
                  }
                } 
              ),
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

