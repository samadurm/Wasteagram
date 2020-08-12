import 'package:intl/intl.dart';
import 'package:test/test.dart';
import 'package:wasteagram/models/food_waste_post.dart';

void main(){
  test('Testing to make sure that the constructor initializes properly', () {
    int wastedItems = 10;
    String url = 'this/is/a/test';
    DateTime date = DateTime.now();
    double latitude = 0.02;
    double longitude = 0.03;

    FoodWastePost testPost = FoodWastePost(
      wastedItems: wastedItems, 
      imageURL: url, 
      date: date, 
      latitude: latitude, 
      longitude: longitude
    );
    
    expect(testPost.wastedItems, wastedItems);
    expect(testPost.imageURL, url);
    expect(testPost.date, date);
    expect(testPost.latitude, latitude);
    expect(testPost.longitude, longitude);
  }); 

  test('Testing the factory constructor to convert a map into a FoodWastePost',
    () {
      
      int wastedItems = 9;
      DateTime date = DateTime.now();
      String imageURL = 'test/url';
      double latitude = 0.05;
      double longitude = 0.7;

      Map <String, dynamic> collection = {
        'wastedItems' : wastedItems,
        'date' : date,
        'imageURL' : imageURL,
        'latitude' : latitude,
        'longitude' : longitude
      };

      FoodWastePost testPost = FoodWastePost.fromMap(collection);

      expect(testPost.wastedItems, wastedItems);
      expect(testPost.imageURL, imageURL);
      expect(testPost.date, date);
      expect(testPost.latitude, latitude);
      expect(testPost.longitude, longitude);
    }
  );

  test('Testing getting readable date.', () {
    int wastedItems = 10;
    String url = 'this/is/a/test';
    DateTime date = DateTime.now();
    double latitude = 0.02;
    double longitude = 0.03;

    FoodWastePost testPost = FoodWastePost(
      wastedItems: wastedItems, 
      imageURL: url, 
      date: date, 
      latitude: latitude, 
      longitude: longitude
    );

    expect(testPost.getReadableDate(), DateFormat('EEEE, MMM d, yyyy').format(date));
  });
  
}