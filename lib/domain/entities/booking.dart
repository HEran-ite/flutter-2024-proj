class Booking {
  final String title;
  final String image;
  final String description;
  final int price;
  final DateTime? bookingDate;

  Booking({
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    this.bookingDate,
  });

  Booking copyWith({DateTime? bookingDate}) {
    return Booking(
      title: title,
      image: image,
      description: description,
      price: price,
      bookingDate: bookingDate ?? this.bookingDate,
    );
  }
}

