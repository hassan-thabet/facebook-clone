import 'package:flutter/material.dart';
import 'package:test_app/models/post_model.dart';

class PostHeaderWidget extends StatelessWidget {
  late final PostModel post;

  PostHeaderWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('${post.image}'),
          radius: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${post.name}'),
            Row(
              children: [
                Text('11h '),
                Image.asset(
                  'assets/icons/world.png',
                  height: 15,
                  width: 15,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.more_horiz_rounded)
      ],
    );
  }
}
