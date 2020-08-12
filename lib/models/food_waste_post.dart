import 'package:intl/intl.dart';

class FoodWastePost{

  final int wastedItems;
  final String imageURL;
  final DateTime date;
  final double latitude;
  final double longitude;

  FoodWastePost({this.wastedItems, this.imageURL, this.date, this.latitude, this.longitude});

  factory FoodWastePost.fromMap(Map<String, dynamic> collection){
    return FoodWastePost(
      wastedItems: collection['wastedItems'],
      imageURL: collection['imageURL'],
      date: collection['date'],
      latitude: collection['latitude'],
      longitude: collection['longitude']
    );
  }

  String getReadableDate() => DateFormat('EEEE, MMM d, yyyy').format(date);
}