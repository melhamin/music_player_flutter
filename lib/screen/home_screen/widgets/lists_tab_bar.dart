import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'tab_bar_item.dart';


class ListsTabBar extends StatelessWidget {
  final TabController controller;
  final Function onTabChanged;
  const ListsTabBar({
    Key key,
    this.controller,
    this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(TAB_TITLES.length, (index) {
        return RotatedBox(
          quarterTurns: 3,
          child: TabBarItem(
            title: TAB_TITLES[index],
            index: index,
            controller: controller,
            onTabChanged: onTabChanged,
          ),
        );
      }),
    );
  }
}
