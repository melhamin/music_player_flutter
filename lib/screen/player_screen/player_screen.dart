
import 'package:flutter/material.dart';
import 'package:music_player/models.dart';
import 'package:music_player/screen/player_screen/widgets/progress_indicator.dart';

import 'widgets/action_buttons.dart';
import 'widgets/app_bar.dart';
import 'widgets/banners.dart';
import 'widgets/nav_bar.dart';

class PlayerScreen extends StatelessWidget {
  final Music music;
  const PlayerScreen({Key key, this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(music: music),
      ),
      body: Column(
        children: [
          Banners(),
          SizedBox(height: 15),
          MProgressIndicator(music: music),
          SizedBox(height: 30),
          ActionButtons(),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
