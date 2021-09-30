import 'package:flutter/material.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/ui/widgets/web_contact_widget.dart';

class ContactsListView extends StatelessWidget {
  late final List<UserModel> users;
  ContactsListView({required this.users});
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 250),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final UserModel user = users[index];
              return Contact(user: user);
            }));
  }
}
