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
import 'package:test_app/ui/widgets/facebook_logo_widget.dart';

class FeedsMobileScreen extends StatelessWidget {
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
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            body: BlocBuilder<FeedsBloc, FeedStates>(builder: (context, state) {
          return NestedScrollView(
            controller: context.read<FeedsBloc>().scrollController,
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.white,
                centerTitle: false,
                floating: true,
                pinned: true,
                title: FacebookLogoWidget(),
                actions: [
                  CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 16,
                      child: Image.asset(
                        'assets/icons/search.png',
                        height: 18,
                        width: 18,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 16,
                        child: Image.asset(
                          'assets/icons/messenger.png',
                          height: 18,
                          width: 18,
                        )),
                  ),
                ],
                bottom: TabBar(
                  tabs: myTabs,
                  indicatorColor: AppColors.App_main_color,
                  labelColor: AppColors.App_main_color,
                  unselectedLabelColor: AppColors.icons_color,
                  onTap: (index) {
                    context.read<FeedsBloc>().onTabChange(index);
                  },
                ),
              ),
            ],
            body: CustomScrollView(
              slivers: [
                (context.read<FeedsBloc>().currentTab == 0)
                    ? SliverToBoxAdapter(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          color: Colors.white,
                          child: Column(
                            children: [
                              NewPostSection(),
                              SizedBox(
                                height: 10,
                              ),
                              StoriesSection(
                                  currentUser: currentUser, stories: stories),
                              SizedBox(height: 15),
                              (state is GetPostsDone)
                                  ? FeedsSection()
                                  : Container(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: (context
                                            .read<FeedsBloc>()
                                            .morePostsAvailable ==
                                        false)
                                    ? Text('no more posts',
                                        style: TextStyle(fontSize: 16))
                                    : CircularProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      )
                    : SliverToBoxAdapter(),
              ],
            ),
          );
        })),
      ),
    );
  }
}
