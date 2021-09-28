import 'package:flutter/material.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/models/story_model.dart';
import 'package:test_app/models/user_model.dart';

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
              return AddStoryCard(
                currentUser: currentUser,
              );
            }
            final StoryModel story = stories[index - 1];
            return StoryCard(
              story: story,
            );
          }),
    );
  }
}

class StoryCard extends StatelessWidget {
  final UserModel? user;
  final StoryModel? story;

  StoryCard({this.user, this.story});
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
                  image: NetworkImage(story!.image),
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
                    backgroundImage: NetworkImage(story!.user.image),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 12),
                child: Text(
                  story!.user.name,
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

class AddStoryCard extends StatelessWidget {
  late final UserModel currentUser;

  AddStoryCard({required this.currentUser});
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
                  image: AssetImage(currentUser.image),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 15.0,
              ),
              padding: EdgeInsets.only(bottom: 8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.App_main_color,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    Text(
                      'Create Story',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
