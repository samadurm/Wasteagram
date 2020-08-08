import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';

class DetailScreen extends StatelessWidget {
  
  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: Text('Wastegram'),
      body: Center(child: Text('Reached the detail screen')),
    );
  }
}