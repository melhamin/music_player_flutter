import 'package:flutter/material.dart';
import 'package:music_player/screen/player_screen/player_screen.dart';

import '../../../models.dart';

class MusicItem extends StatelessWidget {
  final Music item;
  const MusicItem({
    Key key,
    this.item,
  }) : super(key: key);

  void onTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PlayerScreen(music: item)));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(context),
      leading: Container(
        height: 60,
        width: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(item.asset, fit: BoxFit.cover),
        ),
      ),
      title: Text(
        item.title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      subtitle: Text(item.singer),
      trailing: Text(
          '${item.duration.inMinutes}:${(item.duration.inSeconds % 60).toString().padLeft(2, '0')}'),
    );
  }
}
