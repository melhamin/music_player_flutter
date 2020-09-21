import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/constants.dart';
import 'package:music_player/models.dart';

import 'screen/home_screen/home_screen.dart';
import 'screen/home_screen/widgets/lists_tab_bar.dart';
import 'screen/home_screen/widgets/music_item.dart';
import 'screen/home_screen/widgets/nav_bar.dart';
import 'screen/home_screen/widgets/sliding_banners.dart';
import 'screen/home_screen/widgets/tab_bar_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

