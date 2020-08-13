import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/widgets/detail_image.dart';
import 'package:wasteagram/widgets/main_scaffold.dart';


class DetailScreen extends StatelessWidget {
  
  static const routeName = 'details';

  @override
  Widget build(BuildContext context) {

    FoodWastePost post = ModalRoute.of(context).settings.arguments;

    return MainScaffold(
      title: Text('Wastegram'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: Text(post.getReadableDate(), textScaleFactor: 1.5,)),
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 0.6,
              heightFactor: 0.6,
              child: DetailImage(url: post.imageURL)
            ),
          ),
          Text('${post.wastedItems} items', textScaleFactor: 1.5,),
          Text('Location: (${post.latitude}, ${post.longitude})', textScaleFactor: 1.2,)
        ],
      )
    );
  }
}