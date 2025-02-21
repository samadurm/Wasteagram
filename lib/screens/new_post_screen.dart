import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';
import 'package:wasteagram/widgets/new_post.dart';

class NewPostScreen extends StatefulWidget {
  
  static final routeName = 'new_post';
  
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  File image;

  @override
  void initState(){
    super.initState();
    getImage();
  }

  Future getImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      image = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: Text('New Post'),
      body: Center(child: image == null ? CircularProgressIndicator() : NewPost(image: image),),
    );
  }
}