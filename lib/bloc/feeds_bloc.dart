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

  bool morePostsAvailable = true;
  int limit = 2;
  DocumentSnapshot? lastPost;

  void scrollListener() {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if (currentScroll == maxScroll && morePostsAvailable == true) {
        print('load more data ');
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
      (lastPost == null) ? getPostsFirstTime() : loadMorePosts();
    });
  }

  void getPostsFirstTime() {
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
  }

  void loadMorePosts() {
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
}
