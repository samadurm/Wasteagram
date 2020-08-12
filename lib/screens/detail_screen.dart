import 'dart:io';
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
          Center(child: Text(post.getReadableDate())),
          showImage(post.imageURL),
          Text('${post.wastedItems} items'),
          Text('Location: (${post.latitude}, ${post.longitude})')
        ],
      )
    );
  }
}

Widget showImage(String url){
  if(url == null || url.isEmpty){
    return Placeholder();
  }
  return Image.network(url);
}