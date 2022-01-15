// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:instagram/Theme/colors.dart';

class Post extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final bool isLoved;
  final String likedBy;
  final String viewCount;
  final String dayAgo;
  const Post(
      {Key? key,
      required this.profileImg,
      required this.name,
      required this.postImg,
      required this.caption,
      required this.isLoved,
      required this.likedBy,
      required this.viewCount,
      required this.dayAgo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(profileImg), fit: BoxFit.cover)),
              ),
              SizedBox(width: 15),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(postImg), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
          child: Row(
            children: [
              isLoved
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red[800],
                      size: 28,
                    )
                  : Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.messenger_outline,
                color: Colors.white,
                size: 26,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.send_outlined,
                color: Colors.white,
                size: 26,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Liked by ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                  text: "$likedBy",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(
                  text: " and ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                  text: " 48 others",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ))
            ]),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "$name",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(
                  text: " $caption",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ))
            ]),
          ),
        ),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            "View all $viewCount comments",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),),
          )
      ],
    );
  }
}
