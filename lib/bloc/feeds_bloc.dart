import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/post.dart';
import 'feeds_states.dart';

class FeedsBloc extends Cubit<FeedStates>{
  FeedsBloc() : super(FeedsInitialState());
  static FeedsBloc get (context) => BlocProvider.of(context);
  List<Post> posts = [];


  List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.home),),
    Tab(icon: Icon(Icons.group)),
    Tab(icon: Icon(Icons.ondemand_video)),
    Tab(icon: Icon(Icons.notifications_none)),
    Tab(icon: Tab(icon: Icon(Icons.menu)),
    ),
  ];
  int currentTab = 0;

  void onTabChange(index)
  {
    currentTab = index;
    emit((ChangeTabBarIndex()));
  }


  void getPosts()
  {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value){
          value.docs.forEach((element) {
            posts.add(Post.fromJson(element.data()));

          });
          emit((GetPostsDone()));
        })
        .catchError((error) {
          emit((GetPostsError()));
        }

        );
  }
}
