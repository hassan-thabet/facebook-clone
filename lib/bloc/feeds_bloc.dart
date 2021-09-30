import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/models/post_model.dart';

import 'feeds_states.dart';

class FeedsBloc extends Cubit<FeedStates> {
  FeedsBloc() : super(FeedsInitialState());
  static FeedsBloc get(context) => BlocProvider.of(context);

  List<PostModel> posts = [];

  int currentTab = 0;

  void onTabChange(index) {
    currentTab = index;
    emit(ChangeTabBarIndex());
    if (index == 0) {
      getPosts();
    }
  }

  void getMorePosts() {
    emit((GetPostsLoading()));
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));
      });
      emit((GetPostsDone()));
    }).catchError((error) {
      emit((GetPostsError()));
    });
  }

  Future getPosts() async {
    Future.delayed(Duration(seconds: 2), () {
      emit((GetPostsLoading()));
      posts = [];
      FirebaseFirestore.instance.collection('posts').get().then((value) {
        value.docs.forEach((element) {
          posts.add(PostModel.fromJson(element.data()));
        });
        emit((GetPostsDone()));
      }).catchError((error) {
        emit((GetPostsError()));
      });
    });
  }
}
