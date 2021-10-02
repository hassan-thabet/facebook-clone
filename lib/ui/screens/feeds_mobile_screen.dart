import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/feeds_bloc.dart';
import 'package:test_app/bloc/feeds_states.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/data/stories_data.dart';
import 'package:test_app/data/users_data.dart';
import 'package:test_app/ui/components/new_post_section.dart';
import 'package:test_app/ui/components/post_card.dart';
import 'package:test_app/ui/components/stories_section.dart';
import 'package:test_app/ui/screens/feeds_screen.dart';

class FeedsMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          title: Text(
                            'facebook',
                            style: TextStyle(
                              color: AppColors.App_main_color,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1.2,
                            ),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 15,
                                  child: Image.asset(
                                    'assets/icons/search.png',
                                    height: 18,
                                    width: 18,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 4, right: 12, left: 8),
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 15,
                                  child: Image.asset(
                                    'assets/icons/messenger.png',
                                    height: 18,
                                    width: 18,
                                  )),
                            ),
                          ],
                          bottom: TabBar(
                            tabs: FeedsScreen.myTabs,
                            indicatorColor: AppColors.App_main_color,
                            labelColor: AppColors.App_main_color,
                            unselectedLabelColor: AppColors.icons_color,
                            onTap: (index) {
                              context.read<FeedsBloc>().onTabChange(index);
                            },
                          ),
                        ),
                      ],
              body:
                  BlocBuilder<FeedsBloc, FeedStates>(builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    (context.read<FeedsBloc>().currentTab == 0)
                        ? SliverToBoxAdapter(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  NewPostSection(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  StoriesSection(
                                      currentUser: currentUser,
                                      stories: stories),
                                  SizedBox(height: 15),
                                  (state is GetPostsDone)
                                      ? ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              PostCard(
                                            post: context
                                                .read<FeedsBloc>()
                                                .posts[index],
                                          ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(height: 8),
                                          itemCount: context
                                              .read<FeedsBloc>()
                                              .posts
                                              .length,
                                        )
                                      : Container(),
                                        (context
                                              .read<FeedsBloc>()
                                              .morePostsAvailable ==
                                          false)
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Text(
                                            'no more posts',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: CircularProgressIndicator(),
                                        ),
                                ],
                              ),
                            ),
                          )
                        : SliverToBoxAdapter(),
                  ],
                );
              }));
        })),
      ),
    );
  }
}
