import 'package:test/test.dart';
import 'package:wasteagram/models/food_waste_post.dart';

void main() {
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
}
