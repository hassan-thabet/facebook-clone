import 'package:flutter/material.dart';
import 'package:test_app/models/user.dart';

class ContactsListView extends StatelessWidget {
  late final List<User> users;
  ContactsListView({required this.users});
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 250),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final User user = users[index];
              return Contact(user: user);
            }));
  }
}

class Contact extends StatelessWidget {
  late final User user;
  Contact({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: InkWell(
            onTap: (){},
            child: ListTile(
              title: Text(user.name),
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(minHeight: 10 , minWidth: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: InkWell(
            onTap: (){},
            child: ListTile(
              title: Text(user.name),
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(minHeight: 10 , minWidth: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
