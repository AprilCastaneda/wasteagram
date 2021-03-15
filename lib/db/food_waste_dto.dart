class FoodWasteDTO {
  int id;
  DateTime date;
  String image;
  int numItems;
  double latitude;
  double longitude;

  String toString() =>
      'ID: $id, Date: $date, Image: $image, NumItems: $numItems, Latitude: $latitude, Longitude: $longitude';
}
