import 'dart:js';

import 'package:flutter/material.dart';
import 'package:wasteagram/screens/list_screen.dart';

class App extends StatelessWidget {
  
  static final routes = {
    ListScreen.routeName : (context) => ListScreen(),
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Hello world')),
      )
    );
  }
}