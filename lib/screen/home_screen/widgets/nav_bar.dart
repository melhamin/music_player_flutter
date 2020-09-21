import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';


class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 100,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: kShadowColor.withOpacity(0.4),
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(NAV_BAR_ASSETS.length, (index) {
          return SvgPicture.asset(
            NAV_BAR_ASSETS[index],
            color: index == 0 ? Colors.black : Colors.black.withOpacity(0.4),
          );
        })),
      ),
    );
  }
}
