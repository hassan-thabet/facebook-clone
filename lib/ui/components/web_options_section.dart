
import 'package:flutter/material.dart';
import 'package:test_app/ui/widgets/web_option_widget.dart';

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

