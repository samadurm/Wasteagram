import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';


class ListScreen extends StatefulWidget {
  
  static const routeName = '/';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        title: Text('Wastegram'),
        body: Center(child: Text('This is the List Screen')),
        usingButton: true,
    );
  }
}