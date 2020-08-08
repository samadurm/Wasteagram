import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  
  static const routeName = '/';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('This is the List Screen')),
    );
  }
}