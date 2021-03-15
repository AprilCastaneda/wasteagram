class FoodWastePost {
  final int id;
  final DateTime date;
  final String image;
  final int numItems;
  final double latitude;
  final double longitude;

  FoodWastePost(
      {this.id,
      this.date,
      this.image,
      this.numItems,
      this.latitude,
      this.longitude});

  factory FoodWastePost.fromMap(Map<String, dynamic> json) {
    return FoodWastePost(
        date: json['date'],
        image: json['image'],
        numItems: json['numItems'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  DateTime get getDate => date;
  String get getImage => image;
  int get getNumItems => numItems;
  double get getLatitude => latitude;
  double get getLongitude => longitude;
}
