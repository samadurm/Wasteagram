import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';

class DetailScreen extends StatelessWidget {
  
  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {

    FoodWastePost post = ModalRoute.of(context).settings.arguments;

    return MainScaffold(
      title: Text('Wastegram'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('${DateFormat('EEEE, MMM d, yyyy').format(post.date)}')),
          // post.imageURL != '' || post.imageURL == null ? Image.asset(post.imageURL) : Placeholder(),
          Text('${post.wastedItems} items'),
          Text('Location: (${post.latitude}, ${post.longitude})')
        ],
      )
    );
  }
}