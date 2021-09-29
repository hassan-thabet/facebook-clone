import 'package:test_app/bloc/feeds_bloc.dart';

abstract class FeedStates {}

class FeedsInitialState extends FeedStates {}

class ChangeTabBarIndex extends FeedStates {}

class GetPostsLoading extends FeedStates {}

class GetPostsDone extends FeedStates {}

class GetPostsError extends FeedStates {}
