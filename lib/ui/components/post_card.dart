import 'package:flutter/material.dart';
import 'package:test_app/models/post_model.dart';
import 'package:test_app/ui/widgets/post_actions_widget.dart';
import 'package:test_app/ui/widgets/post_content_widget.dart';
import 'package:test_app/ui/widgets/post_details_widget.dart';
import 'package:test_app/ui/widgets/post_header_widget.dart';

class PostCard extends StatelessWidget {
  late final PostModel post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                PostHeaderWidget(post: post),
                PostContentWidget(post: post),
                PostDetailsWidget(),
                PostActionsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
