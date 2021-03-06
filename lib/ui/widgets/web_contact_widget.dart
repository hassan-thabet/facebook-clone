import 'package:flutter/material.dart';
import 'package:test_app/models/user_model.dart';

class Contact extends StatelessWidget {
  late final UserModel user;

  Contact({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: InkWell(
            onTap: () {},
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
                      constraints: BoxConstraints(minHeight: 10, minWidth: 10),
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
            onTap: () {},
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
                      constraints: BoxConstraints(minHeight: 10, minWidth: 10),
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
