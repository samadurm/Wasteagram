import 'package:flutter/material.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

class App extends StatelessWidget {
  
  static final String title = 'Wastegram';

  static final routes = {
    ListScreen.routeName : (context) => ListScreen(),
    DetailScreen.routeName : (context) => DetailScreen(),
    NewPostScreen.routeName : (context) => NewPostScreen()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      routes: routes,
      initialRoute: ListScreen.routeName,
    );
  }
}