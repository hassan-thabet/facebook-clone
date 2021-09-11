import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/feeds_bloc.dart';
import 'package:test_app/bloc/feeds_states.dart';
import 'package:test_app/constants/app_colors.dart';
import 'package:test_app/data/users_data.dart';
import 'package:test_app/data/stories_data.dart';
import 'package:test_app/widgets/new_post_section.dart';
import 'package:test_app/widgets/post_card.dart';
import 'package:test_app/widgets/stories_section.dart';
import 'package:test_app/widgets/web_contacts_listview.dart';
import 'package:test_app/widgets/web_options_listview.dart';

class FeedsScreen extends StatefulWidget {
  static String id = 'FeedsScreen';

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
            ? FeedScreeDesktop(scrollController: trackingScrollController)
            : FeedScreenMobile(scrollController: trackingScrollController),
      ),
    );
  }
}

class FeedScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const FeedScreenMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FeedsBloc()..getPosts(),
      child: BlocConsumer<FeedsBloc, FeedStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: DefaultTabController(
                length: 5,
                initialIndex: 0,
                child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverSafeArea(
                            top: false,
                            sliver: SliverAppBar(
                              backgroundColor: Colors.white,
                              centerTitle: false,
                              floating: true,
                              pinned: true,
                              snap: false,
                              primary: true,
                              forceElevated: innerBoxIsScrolled,
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
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
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
                                tabs: FeedsBloc.get(context).myTabs,
                                indicatorColor: AppColors.App_main_color,
                                labelColor: AppColors.App_main_color,
                                unselectedLabelColor: AppColors.icons_color,
                                onTap: (index) {
                                  FeedsBloc.get(context).onTabChange(index);
                                },
                              ),
                            ),
                          ),
                        )
                      ];
                    },
                    body: CustomScrollView(
                      slivers: [
                        (FeedsBloc.get(context).currentTab == 0)
                            ? SliverToBoxAdapter(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      NewPostSection(),
                                      SizedBox(height: 10,),
                                      StoriesSection(
                                          currentUser: currentUser,
                                          stories: stories),
                                      SizedBox(height: 15),


                                      ListView.separated(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder: (context , index) => PostCard(post: FeedsBloc.get(context).posts[index]),
                                          separatorBuilder: (context , index) => SizedBox(height: 8),
                                          itemCount: FeedsBloc.get(context).posts.length,
                                      ),
                                      // PostCard(FeedsBloc.get(context).posts[index]),
                                    ],
                                  ),
                                ),
                              )
                            : SliverToBoxAdapter(),
                      ],
                    ))
            ),
          );
        },
      ),
    );
  }
}

class FeedScreeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const FeedScreeDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => FeedsBloc()..getPosts(),
      child: BlocConsumer<FeedsBloc , FeedStates>(
        listener: (context , state){},
        builder: (context , state)
        {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 8),
                child: Image.asset('assets/icons/fb-logo.png'),
              ),
              title: Container(
                width: size.width * 0.4,
                child: DefaultTabController(
                    length: 5,
                    child: TabBar(
                      tabs: FeedsBloc.get(context).myTabs,
                      indicatorColor: AppColors.App_main_color,
                      labelColor: AppColors.App_main_color,
                      unselectedLabelColor: AppColors.icons_color,
                      onTap: (index) {
                        FeedsBloc.get(context).onTabChange(index);
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
                        backgroundImage: AssetImage('assets/images/current_user.png'),
                      ),
                      SizedBox(width: 4,),
                      Text('Hassan' , style: TextStyle(color: Colors.black),),
                      SizedBox(width: 10,),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.apps_sharp , color: Colors.black87,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.chat , color: Colors.black87,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.notifications_active_sharp , color: Colors.black87,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.keyboard_arrow_down_outlined , color: Colors.black87,),
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
                    )
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      child: CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            sliver: SliverToBoxAdapter(
                              child: StoriesSection(currentUser: currentUser, stories: stories),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            sliver: SliverToBoxAdapter(
                              child: NewPostSection(),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            sliver: SliverToBoxAdapter(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context , index) => PostCard(post: FeedsBloc.get(context).posts[index]),
                                separatorBuilder: (context , index) => SizedBox(height: 8),
                                itemCount: FeedsBloc.get(context).posts.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Flexible(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ContactsListView(users: users,),
                    )
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
