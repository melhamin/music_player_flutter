import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'lists_tab_bar.dart';
import 'music_item.dart';

class Lists extends StatefulWidget {
  const Lists({
    Key key,
  }) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _controller = TabController(vsync: this, length: 3);
  }

  void onTabChanged(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          ListsTabBar(controller: _controller, onTabChanged: onTabChanged),
          SizedBox(width: 10),
          Flexible(
            child: TabBarView(
              controller: _controller,
              children: [
                Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: LATEST.length,
                    itemBuilder: (_, i) => MusicItem(item: LATEST[i]),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: FAVORITES.length,
                    itemBuilder: (_, i) => MusicItem(item: FAVORITES[i]),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: RECENT.length,
                    itemBuilder: (_, i) => MusicItem(item: RECENT[i]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
