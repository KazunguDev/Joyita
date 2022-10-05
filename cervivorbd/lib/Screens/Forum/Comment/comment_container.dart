import 'package:flutter/material.dart';

class CommentContainer extends StatelessWidget {
  final String? username;
  final String? userId;
  final String? comment;
  final String? timestamp;

  const CommentContainer({
    this.username,
    this.userId,
    this.comment,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    username!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    timestamp.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    comment!,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
