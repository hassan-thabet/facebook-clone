import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'feeds_desktop_screen.dart';
import 'feeds_mobile_screen.dart';

class FeedsScreen extends StatefulWidget {
  static String id = 'FeedsScreen';
  static List<Tab> myTabs = <Tab>[
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(icon: Icon(Icons.group)),
    Tab(icon: Icon(Icons.ondemand_video)),
    Tab(icon: Icon(Icons.notifications_none)),
    Tab(
      icon: Tab(icon: Icon(Icons.menu)),
    ),
  ];

  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TrackingScrollController trackingScrollController =
      TrackingScrollController();

  void dispose() {
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: (kIsWeb)
            ? FeedsDesktopScreen(scrollController: trackingScrollController)
            : FeedsMobileScreen(scrollController: trackingScrollController),
      ),
    );
  }
}
