import 'package:flutter/material.dart';
import 'package:test_app/models/post.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostCard extends StatelessWidget {
  final Post? post;
  PostCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('${post!.image}'),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${post!.name}'),
                        Row(
                          children: [
                            Text('11h '),
                            Image.asset(
                              'assets/icons/world.png',
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_horiz_rounded)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('${post!.captionText}'),
                ),
                (post!.postImage != null)
                    ? (post!.postImage!.length == 1)
                        ? Image.network(
                            '${post!.postImage![0]}',
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
                                    index < post!.postImage!.length;
                                    index++)
                                  Image.network(
                                    post!.postImage![index],
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/like.png',
                        height: 16,
                        width: 16,
                      ),
                      Image.asset(
                        'assets/icons/love.png',
                        height: 16,
                        width: 16,
                      ),
                      Image.asset(
                        'assets/icons/angry.png',
                        height: 16,
                        width: 16,
                      ),
                      Spacer(),
                      Text('25 Comments 182 Shares'),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/post_like.png',
                            color: Colors.black54,
                            height: 18,
                            width: 18,
                          ),
                          label: Text(
                            'Like',
                            style: TextStyle(color: Colors.black54),
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/post_comment.png',
                            color: Colors.black54,
                            height: 18,
                            width: 18,
                          ),
                          label: Text(
                            'Comment',
                            style: TextStyle(color: Colors.black54),
                          )),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/post_share.png',
                            color: Colors.black54,
                            height: 18,
                            width: 18,
                          ),
                          label: Text(
                            'Share',
                            style: TextStyle(color: Colors.black54),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
