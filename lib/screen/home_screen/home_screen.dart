import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/screen/home_screen/widgets/lists.dart';
import 'package:music_player/screen/home_screen/widgets/nav_bar.dart';
import 'package:music_player/screen/home_screen/widgets/sliding_banners.dart';

import '../../main.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: SvgPicture.asset('assets/icons/logo.svg'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          // height of screen minus app bar height and bottom navigation bar
          height: size.height - 100 - kToolbarHeight,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.5,
                    child: SlidingBanners(),
                  ),
                  Expanded(
                    child: Lists(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}