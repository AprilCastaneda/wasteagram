import 'package:test/test.dart';
import 'package:wasteagram/models/food_waste_post.dart';

void main() {
  group('Food Waste Post Tests', () {
    test('Post created from Map should have appropriate property values', () {
      // Setup - define values we use
      final date = DateTime.parse('2021-01-01');
      const image = 'FAKE';
      const numItems = 1;
      const latitude = 1.0;
      const longitude = 2.0;

      // Exercise - exercise the subject under test
      final food_waste_post = FoodWastePost.fromMap({
        'date': date,
        'image': image,
        'numItems': numItems,
        'latitude': latitude,
        'longitude': longitude,
      });

      // Verify - expect(actual, expected)
      expect(food_waste_post.date, date);
      expect(food_waste_post.image, image);
      expect(food_waste_post.numItems, numItems);
      expect(food_waste_post.latitude, latitude);
      expect(food_waste_post.longitude, longitude);
    });
    test('Post created without optional values should have all null values',
        () {
      // Setup - define values we use
      final date = null;
      const image = null;
      const numItems = null;
      const latitude = null;
      const longitude = null;

      // Exercise - exercise the subject under test
      final food_waste_post = FoodWastePost();

      // Verify - expect(actual, expected)
      expect(food_waste_post.date, date);
      expect(food_waste_post.image, image);
      expect(food_waste_post.numItems, numItems);
      expect(food_waste_post.latitude, latitude);
      expect(food_waste_post.longitude, longitude);
    });
  });
}
