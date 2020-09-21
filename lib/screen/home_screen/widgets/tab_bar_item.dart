import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TabBarItem extends StatefulWidget {
  final String title;
  final int index; // this tab's index
  final Function onTabChanged;
  final TabController controller;

  const TabBarItem({
    Key key,
    this.title,
    this.index,
    this.controller,
    this.onTabChanged,
  }) : super(key: key);

  @override
  _TabBarItemState createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem>
    with SingleTickerProviderStateMixin {
  // lets animate current tab indicator
  bool _isCurrentTab;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _isCurrentTab = widget.index == widget.controller.index;

    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    // needed for animating first tab
    if (_isCurrentTab) _animationController.forward();

    // listen for tab changes
    widget.controller.addListener(() {
      _isCurrentTab = widget.index == widget.controller.index;

      _isCurrentTab
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // change tab on tap
  void onTap() {
    // change currentIndex to this tab's index
    widget.onTabChanged(widget.index);

    // animate tab indicator
    _isCurrentTab
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ScaleTransition(
            scale: _animationController,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              color:
                  _isCurrentTab ? Colors.black : Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
