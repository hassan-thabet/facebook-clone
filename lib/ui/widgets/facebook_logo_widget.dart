import 'package:flutter/material.dart';
import 'package:test_app/constants/app_colors.dart';

class FacebookLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'facebook',
      style: TextStyle(
        color: AppColors.App_main_color,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.2,
      ),
    );
  }
}
