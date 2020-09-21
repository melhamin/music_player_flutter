import 'package:flutter/material.dart';

import '../../../constants.dart';


class Banners extends StatelessWidget {
  const Banners({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/banner2.png'),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/banner3.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor.withOpacity(0.7),
                    offset: Offset(0, 10),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/banner1.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
