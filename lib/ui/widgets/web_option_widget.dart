import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final bool? currentUser;
  final String? profileImage;
  late final String title;
  final String? iconData;

  Option(
      {this.profileImage,
      required this.title,
      this.iconData,
      required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
          title: Text(title),
          leading: (currentUser == false)
              ? Image.asset(
                  iconData!,
                  height: 22,
                  width: 22,
                )
              : CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(
                    profileImage!,
                  ),
                )),
    );
  }
}
