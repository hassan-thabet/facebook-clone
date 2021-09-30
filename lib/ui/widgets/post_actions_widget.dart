import 'package:flutter/material.dart';

class PostActionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/post_like.png',
                color: Colors.black54,
                height: 18,
                width: 18,
              ),
              label: Text(
                'Like',
                style: TextStyle(color: Colors.black54),
              )),
          TextButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/post_comment.png',
                color: Colors.black54,
                height: 18,
                width: 18,
              ),
              label: Text(
                'Comment',
                style: TextStyle(color: Colors.black54),
              )),
          TextButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/post_share.png',
                color: Colors.black54,
                height: 18,
                width: 18,
              ),
              label: Text(
                'Share',
                style: TextStyle(color: Colors.black54),
              )),
        ],
      ),
    );
  }
}
