import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/feeds_bloc.dart';
import 'package:test_app/bloc/feeds_states.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/data/stories_data.dart';
import 'package:test_app/data/users_data.dart';
import 'package:test_app/ui/components/new_post_section.dart';
import 'package:test_app/ui/components/post_card.dart';
import 'package:test_app/ui/components/stories_section.dart';
import 'package:test_app/ui/components/web_contacts_section.dart';
import 'package:test_app/ui/components/web_options_section.dart';

import 'feeds_screen.dart';

class FeedsDesktopScreen extends StatelessWidget {
  final TrackingScrollController trackingScrollController;

  const FeedsDesktopScreen({
    Key? key,
    required this.trackingScrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => FeedsBloc()..getPosts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Image.asset('assets/icons/fb-logo.png'),
          ),
          title: Container(
            width: size.width * 0.4,
            child: DefaultTabController(
              length: 5,
              child: TabBar(
                tabs: FeedsScreen.myTabs,
                indicatorColor: AppColors.App_main_color,
                labelColor: AppColors.App_main_color,
                unselectedLabelColor: AppColors.icons_color,
                onTap: (index) {
                  FeedsBloc().onTabChange(index);
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/current_user.png'),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Hassan',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.apps_sharp,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.chat,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.notifications_active_sharp,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        body: Row(
          children: [
            Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OptionsListView(),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        sliver: SliverToBoxAdapter(
                          child: StoriesSection(
                              currentUser: currentUser, stories: stories),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        sliver: SliverToBoxAdapter(
                          child: NewPostSection(),
                        ),
                      ),
                      BlocBuilder<FeedsBloc, FeedStates>(
                          builder: (context, state) {
                        return SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          sliver: SliverToBoxAdapter(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => PostCard(
                                  post: context.read<FeedsBloc>().posts[index]),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 8),
                              itemCount: context.read<FeedsBloc>().posts.length,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.topRight,
                  child: ContactsListView(
                    users: users,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
