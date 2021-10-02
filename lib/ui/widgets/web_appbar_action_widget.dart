import 'package:flutter/material.dart';

class WebAppbarActionWidget extends StatelessWidget {
  late final IconData iconData;

  WebAppbarActionWidget(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(
          iconData,
          color: Colors.black87,
        ),
      ),
    );
  }
}
