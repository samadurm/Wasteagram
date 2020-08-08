import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  
  final Text title;
  final Widget body;

  MainScaffold({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: title),
        ),
        body: body
    );
  }
}