import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';
import 'package:wasteagram/widgets/post_display.dart';


class ListScreen extends StatelessWidget {
  
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        title: Text('Wastegram'),
        usingButton: true,
        body: PostDisplay(),
    );
  }
}  