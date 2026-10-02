class PlaceModel {
  int? id;
  final String name;
  final String description;
  final String category;
  final String imagePath;
  final double latitude;
  final double longitude;
  final DateTime createdAt;

  PlaceModel({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imagePath,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
  });
}
