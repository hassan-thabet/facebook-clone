import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/feeds_bloc.dart';
import 'package:test_app/bloc/feeds_states.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/data/stories_data.dart';
import 'package:test_app/data/users_data.dart';
import 'package:test_app/ui/components/feeds_section.dart';
import 'package:test_app/ui/components/new_post_section.dart';
import 'package:test_app/ui/components/stories_section.dart';
import 'package:test_app/ui/components/web_contacts_section.dart';
import 'package:test_app/ui/components/web_options_section.dart';
import 'package:test_app/ui/widgets/web_appbar_action_widget.dart';

class FeedsDesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Tab> myTabs = <Tab>[
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

    return BlocProvider(
        create: (BuildContext context) => FeedsBloc()
          ..getPosts()
          ..scrollListener(),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          var size = MediaQuery.of(context).size;
          print(constraints.minWidth.toInt());
          return Scaffold(
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
                  child: BlocBuilder<FeedsBloc, FeedStates>(
                    builder: (context, state) {
                      return TabBar(
                        tabs: myTabs,
                        indicatorColor: AppColors.App_main_color,
                        labelColor: AppColors.App_main_color,
                        unselectedLabelColor: AppColors.icons_color,
                        onTap: (index) {
                          context.read<FeedsBloc>().onTabChange(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              actions: [
                (constraints.minWidth.toInt() > 820)
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/current_user.png'),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Hassan',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          WebAppbarActionWidget(Icons.apps_sharp),
                          WebAppbarActionWidget(Icons.chat),
                          WebAppbarActionWidget(
                              Icons.notifications_active_sharp),
                          WebAppbarActionWidget(
                              Icons.keyboard_arrow_down_outlined),
                        ],
                      )
                    : Padding(
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
                          ],
                        ),
                      ),
              ],
            ),
            body: BlocBuilder<FeedsBloc, FeedStates>(
              builder: (context, state) {
                return (context.read<FeedsBloc>().currentTab == 0)
                    ? Row(
                        children: [
                          (constraints.minWidth.toInt() > 550)
                              ? Flexible(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: OptionsListView(),
                                  ))
                              : Container(),
                          Expanded(
                              flex: 4,
                              child: Container(
                                child: BlocBuilder<FeedsBloc, FeedStates>(
                                  builder: (context, state) {
                                    return CustomScrollView(
                                      controller: context
                                          .read<FeedsBloc>()
                                          .scrollController,
                                      slivers: [
                                        SliverToBoxAdapter(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 12),
                                            child: Column(
                                              children: [
                                                StoriesSection(
                                                    currentUser: currentUser,
                                                    stories: stories),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                NewPostSection(),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                FeedsSection(),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                (context
                                                            .read<FeedsBloc>()
                                                            .morePostsAvailable ==
                                                        false)
                                                    ? Center(
                                                        child: Text(
                                                            'no more posts',
                                                            style: TextStyle(
                                                                fontSize: 16)))
                                                    : CircularProgressIndicator()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )),
                          (constraints.minWidth.toInt() > 820)
                              ? Flexible(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: ContactsListView(
                                      users: users,
                                    ),
                                  ))
                              : Container(),
                        ],
                      )
                    : Container();
              },
            ),
          );
        }));
  }
}
