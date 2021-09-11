
import 'package:flutter/material.dart';

class OptionsListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: [
            Option(currentUser : true ,title: 'Hassan Thabet', profileImage: 'assets/images/current_user.png'),
            Option(currentUser : false ,title: 'Friends', iconData: 'assets/icons/group.png'),
            Option(currentUser : false ,title: 'Saved', iconData: 'assets/icons/bookmark.png'),
            Option(currentUser : false ,title: 'Marketplace', iconData: 'assets/icons/store.png'),
            Option(currentUser : false ,title: 'Watch', iconData: 'assets/icons/facebook.png'),
            Option(currentUser : false ,title: 'Groups', iconData: 'icons/groups.png'),
            Option(currentUser : false ,title: 'See More', iconData: 'icons/arrow-down-sign-to-navigate.png'),


            Option(currentUser : false ,title: 'Friends', iconData: 'assets/icons/group.png'),
            Option(currentUser : false ,title: 'Saved', iconData: 'assets/icons/bookmark.png'),
            Option(currentUser : false ,title: 'Marketplace', iconData: 'assets/icons/store.png'),
          ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  final bool? currentUser;
  final String? profileImage;
  late final String title;
  final String? iconData;

  Option({this.profileImage , required this.title , this.iconData, required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
        title: Text(title),
        leading: (currentUser == false)
            ? Image.asset(iconData! , height: 22, width: 22,)
            : CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(profileImage! , ),
              )

      ),
    );
  }
}
