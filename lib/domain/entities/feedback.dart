// models/feedback_data.dart
class AppFeedback {
  final String user;
  final String comment;
  final int rating;

  AppFeedback({
    required this.user,
    required this.comment,
    required this.rating,
  });

  factory AppFeedback.fromJson(Map<String, dynamic> json) {
    return AppFeedback(
      user: json['user'],
      comment: json['comment'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'comment': comment,
      'rating': rating,
    };
  }
}
