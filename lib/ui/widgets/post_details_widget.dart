import 'package:flutter/material.dart';

class PostDetailsWidget extends StatelessWidget {
  const PostDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/like.png',
                height: 16,
                width: 16,
              ),
              Image.asset(
                'assets/icons/love.png',
                height: 16,
                width: 16,
              ),
              Image.asset(
                'assets/icons/angry.png',
                height: 16,
                width: 16,
              ),
              Spacer(),
              Text('25 Comments 182 Shares'),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
