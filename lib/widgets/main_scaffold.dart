import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

class MainScaffold extends StatelessWidget {
  
  final Text title;
  final Widget body;
  final bool usingButton;

  MainScaffold({this.title, this.body, this.usingButton=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: title),
        ),
        body: body,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: usingButton ? button(context) : null,
    );
  }
}

FloatingActionButton button(BuildContext context){
  return FloatingActionButton(
    child: Icon(Icons.add_a_photo),
    onPressed: () { 
      Navigator.pushNamed(context, NewPostScreen.routeName);
    }
  );
}