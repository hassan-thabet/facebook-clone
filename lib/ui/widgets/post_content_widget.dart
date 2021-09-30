import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/post_model.dart';

class PostContentWidget extends StatelessWidget {
  late final PostModel post;

  PostContentWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('${post.captionText}'),
        ),
        (post.postImage != null)
            ? (post.postImage!.length == 1)
                ? Image.network(
                    '${post.postImage![0]}',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 2),
                          enlargeCenterPage: true,
                        ),
                        items: <Widget>[
                          for (var index = 0;
                              index < post.postImage!.length;
                              index++)
                            Image.network(
                              post.postImage![index],
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                        ]),
                  )
            : Container(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
