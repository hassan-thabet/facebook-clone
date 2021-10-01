import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/post_model.dart';

import 'feeds_states.dart';

class FeedsBloc extends Cubit<FeedStates> {
  FeedsBloc() : super(FeedsInitialState());

  ScrollController scrollController = ScrollController();
  List<PostModel> posts = [];
  int currentTab = 0;

  bool loadingMorePosts = false;
  bool morePostsAvailable = true;
  int limit = 2;
  DocumentSnapshot? lastPost;

  void scrollListener() {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if (maxScroll == currentScroll && morePostsAvailable == true) {
        print('scrolled');
        getPosts();
      }
    });
  }

  void onTabChange(index) {
    currentTab = index;
    lastPost = null;
    morePostsAvailable = true;

    if (index == 0) {
      getPosts();
    }
    emit(ChangeTabBarIndex());
  }

  Future getPosts() async {
    Future.delayed(Duration(seconds: 2), () {
      if (lastPost == null) {
        emit((GetPostsLoading()));
        posts = [];
        FirebaseFirestore.instance
            .collection('posts')
            .limit(limit)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            posts.add(PostModel.fromJson(element.data()));
          });
          lastPost = value.docs.last;
          emit((GetPostsDone()));
        });
      } else {
        FirebaseFirestore.instance
            .collection('posts')
            .startAfterDocument(lastPost!)
            .limit(limit)
            .get()
            .then((value) {
          value.docs.forEach((element) {
            posts.add(PostModel.fromJson(element.data()));
          });
          lastPost = value.docs.last;
          if (value.docs.length < limit) {
            morePostsAvailable = false;
          }
          emit((GetPostsDone()));
        });
      }
    });
  }
}
