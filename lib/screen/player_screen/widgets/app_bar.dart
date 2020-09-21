import 'package:flutter/material.dart';
import 'package:music_player/models.dart';


class MyAppBar extends StatelessWidget {
  final Music music;
  const MyAppBar({
    Key key, this.music,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: BackButton(color: Colors.black),
      title: Column(
        children: [
          Text(
            music.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            music.singer,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
