import 'package:flutter/material.dart';

import '../../../constants.dart';


class SlidingBanners extends StatefulWidget {
  const SlidingBanners({
    Key key,
  }) : super(key: key);

  @override
  _SlidingBannersState createState() => _SlidingBannersState();
}

class _SlidingBannersState extends State<SlidingBanners> {
  PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _currentIndex,
      keepPage: false,
      viewportFraction: 0.6, // fraction of the page to be shown
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return PageView.builder(
          controller: _controller,
          itemCount: BANNERS.length,
          itemBuilder: (_, i) => _buildItem(i, constraints),
        );
      },
    );
  }

  Widget _buildItem(int index, BoxConstraints constraints) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        double value = 1;

        // this is not executed because it's false at the beginning
        if (_controller.position.haveDimensions) {
          value = _controller.page - index;
          value = (1 - value.abs() * 0.35).clamp(0, 1);
        }
        else value = _currentIndex == index ? 1 : 0.6;

        return Center(
          child: SizedBox(
            width: Curves.easeOut.transform(value) * constraints.maxWidth * 0.6,
            height:
                Curves.easeOut.transform(value) * constraints.maxHeight * 0.9,
            child: child,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: _currentIndex == index
              ? [
                  BoxShadow(
                    color: kShadowColor.withOpacity(0.4),
                    offset: Offset(0, 5),
                    blurRadius: 10,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            BANNERS[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
