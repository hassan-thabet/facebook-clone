import 'package:flutter/material.dart';
import 'package:test_app/models/story_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/ui/components/create_new_story_section.dart';
import 'package:test_app/ui/widgets/story_widget.dart';

class StoriesSection extends StatelessWidget {
  late final UserModel currentUser;
  late final List<StoryModel> stories;

  StoriesSection({required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return CreateNewStoryWidget(
                currentUser: currentUser,
              );
            }
            final StoryModel story = stories[index - 1];
            return StoryWidget(story: story);
          }),
    );
  }
}
