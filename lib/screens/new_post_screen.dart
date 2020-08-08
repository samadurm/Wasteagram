import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';

class NewPostScreen extends StatefulWidget {
  
  static final routeName = 'new_post';
  
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: Text('Wastegram'),
      body: Center(child: Text('Reached the new post screen'),),
    );
  }
}