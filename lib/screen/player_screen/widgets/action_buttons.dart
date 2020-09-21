import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset('assets/icons/replay.svg'),
        SvgPicture.asset('assets/icons/speaker.svg'),
        SvgPicture.asset('assets/icons/favorite_solid.svg'),
      ],
    );
  }
}