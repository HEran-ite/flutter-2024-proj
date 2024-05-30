import 'package:fffff/domain/entities/feedback.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedbackService {
  final String baseUrl;

  FeedbackService(this.baseUrl);

  Future<List<AppFeedback>> fetchFeedback() async {
    final response = await http.get(Uri.parse('$baseUrl/feedback'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => AppFeedback.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load feedback');
    }
  }

  Future<void> postFeedback(AppFeedback feedback) async {
    final response = await http.post(
      Uri.parse('$baseUrl/feedback'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(feedback.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to post feedback');
    }
  }
}

final feedbackServiceProvider = Provider<FeedbackService>((ref) {
  return FeedbackService('http://localhost:7000');
});

final feedbackListProvider = FutureProvider<List<AppFeedback>>((ref) async {
  final feedbackService = ref.read(feedbackServiceProvider);
  return feedbackService.fetchFeedback();
});

final postFeedbackProvider = StateNotifierProvider<PostFeedbackNotifier, AsyncValue<void>>((ref) {
  final feedbackService = ref.read(feedbackServiceProvider);
  return PostFeedbackNotifier(feedbackService);
});

class PostFeedbackNotifier extends StateNotifier<AsyncValue<void>> {
  final FeedbackService feedbackService;

  PostFeedbackNotifier(this.feedbackService) : super(const AsyncValue.data(null));

  Future<void> postFeedback(AppFeedback feedback) async {
    state = const AsyncValue.loading();
    try {
      await feedbackService.postFeedback(feedback);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
