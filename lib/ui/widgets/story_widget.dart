import 'package:flutter/material.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/models/story_model.dart';

class StoryWidget extends StatelessWidget {
  late final StoryModel story;

  StoryWidget({required this.story});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.20 / 3,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(story.image),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.App_main_color,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(story.user.image),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 12),
                child: Text(
                  story.user.name,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
