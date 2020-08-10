import 'dart:io';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  
  final File image;
  NewPost({this.image});

  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox( // make this a fractionally sized box
          height: 400,
          width: 400,
          child: Image.file(widget.image),
        ),
        Form(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Number of Wasted Items'),
            keyboardType: TextInputType.number,
          ),
        ),
        RaisedButton(
          child: Icon(Icons.cloud_upload), 
          onPressed: () { print('Need to submit to Firebase'); } 
        )
      ],
    );
  }
}