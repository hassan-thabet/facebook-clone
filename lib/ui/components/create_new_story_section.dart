import 'package:flutter/material.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/models/user_model.dart';

class CreateNewStoryWidget extends StatelessWidget {
  late final UserModel currentUser;

  CreateNewStoryWidget({required this.currentUser});

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
