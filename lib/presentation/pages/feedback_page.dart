import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffff/presentation/providers/feedback_provider.dart';
import 'package:fffff/domain/entities/feedback.dart';
import 'package:fffff/presentation/widgets/appbar.dart';
import 'package:fffff/presentation/widgets/drawer.dart';

class FeedbackPage extends ConsumerStatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends ConsumerState<FeedbackPage> {
  int feedbackValue = 0;
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final feedbackListAsyncValue = ref.watch(feedbackListProvider);

    return Scaffold(
      appBar: AppAppBar(),
      drawer: AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 252, 241, 230),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chat box
            Expanded(
              child: feedbackListAsyncValue.when(
                data: (feedbackList) {
                  return ListView.builder(
                    itemCount: feedbackList.length,
                    itemBuilder: (context, index) {
                      final feedback = feedbackList[index];
                      return ListTile(
                        title: Text(feedback.comment),
                        subtitle: Text(feedback.user),
                        trailing: Icon(
                          feedback.rating >= 4
                              ? Icons.sentiment_very_satisfied
                              : feedback.rating >= 3
                                  ? Icons.sentiment_satisfied
                                  : feedback.rating >= 2
                                      ? Icons.sentiment_neutral
                                      : Icons.sentiment_dissatisfied,
                        ),
                      );
                    },
                  );
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'How would you rate our app?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied),
                  onPressed: () {
                    setState(() {
                      feedbackValue = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_dissatisfied),
                  onPressed: () {
                    setState(() {
                      feedbackValue = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_neutral),
                  onPressed: () {
                    setState(() {
                      feedbackValue = 3;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied),
                  onPressed: () {
                    setState(() {
                      feedbackValue = 4;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_very_satisfied),
                  onPressed: () {
                    setState(() {
                      feedbackValue = 5;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Your Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Additional Comments:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Enter your comments here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final user = _userController.text;
                    final comment = _commentController.text;

                    if (user.isEmpty || comment.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your name and comment')),
                      );
                      return;
                    }

                    final feedback = AppFeedback(
                      user: user,
                      comment: comment,
                      rating: feedbackValue,
                    );

                    ref.read(postFeedbackProvider.notifier).postFeedback(feedback).then((_) {
                      // ignore: unused_result
                      ref.refresh(feedbackListProvider); // Refresh the feedback list
                      _userController.clear();
                      _commentController.clear();
                      setState(() {
                        feedbackValue = 0;
                      });
                    });
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
