import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/feeds_bloc.dart';
import 'package:test_app/ui/components/post_card.dart';

class FeedsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => PostCard(
        post: context.read<FeedsBloc>().posts[index],
      ),
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: context.read<FeedsBloc>().posts.length,
    );
  }
}
