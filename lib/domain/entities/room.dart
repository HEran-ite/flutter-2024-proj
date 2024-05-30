class RoomCategory {
  final String title;
  final List<String> images;
  final List<String> descriptions;
  final List<int> prices;

  RoomCategory({
    required this.title,
    required this.images,
    required this.descriptions,
    required this.prices,
  });

  RoomCategory copyWith({
    String? title,
    List<String>? images,
    List<String>? descriptions,
    List<int>? prices,
  }) {
    return RoomCategory(
      title: title ?? this.title,
      images: images ?? this.images,
      descriptions: descriptions ?? this.descriptions,
      prices: prices ?? this.prices,
    );
  }
}
