
import 'package:flutter/material.dart';
class NewPostSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                    'assets/images/current_user.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration:
                  InputDecoration.collapsed(
                    hintText:
                    'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.video_call_outlined,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Live',
                        style: TextStyle(
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(
                      vertical: 8),
                  child: VerticalDivider(
                    color: Colors.black,
                    width: 12,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.video_call_outlined,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Photo',
                        style: TextStyle(
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(
                      vertical: 8),
                  child: VerticalDivider(
                    color: Colors.black87,
                    width: 1,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.video_call_outlined,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Room',
                        style: TextStyle(
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
