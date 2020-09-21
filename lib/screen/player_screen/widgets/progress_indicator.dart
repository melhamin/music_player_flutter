import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models.dart';


class MProgressIndicator extends StatefulWidget {
  final Music music;
  const MProgressIndicator({
    Key key,
    this.music,
  }) : super(key: key);

  @override
  _MProgressIndicatorState createState() => _MProgressIndicatorState();
}

class _MProgressIndicatorState extends State<MProgressIndicator> {
  // let's take care of progress indocator

  Timer _timer;
  double _progress = 0; // current progress
  double _width = 0; // maximum width of progress bar
  int _elapsedSeconds;

  // this is not the best implementaiton but for the demo purpose 
  // it's the simplest way to implement

  @override
  void initState() {
    super.initState();
    _elapsedSeconds = 0;

    Future.delayed(Duration.zero).then((value) {
      setState(() {
        _width = MediaQuery.of(context).size.width -
            30; // 30 - left and right padding
      });
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.mounted) {
        setState(() {
          // rescale progress in range of (0, _width)
          _progress =
              1 + _elapsedSeconds * _width / widget.music.duration.inSeconds;
          _elapsedSeconds++;
        });
      }
      // reached the end cancel the timer
      if(_elapsedSeconds == widget.music.duration.inSeconds) {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        children: [
          Stack(
            children: [
              Container(
                height: 40,
                child: SvgPicture.asset(
                  'assets/icons/progress.svg',
                  color: kPrimaryColor,
                ),
              ),

              // this will crate a layer over the progress indicator
              // it' width will be decreased as time passes so
              // progress bar would seem to be progressing
              Positioned(
                right: 0,
                child: Container(
                  height: 40,
                  color: Colors.white.withOpacity(0.7),
                  width: _progress > _width ? 0 : _width - _progress,
                ),
              ),
            ],
          ),
          ElapsedDuration(
            elapsedSeconds: _elapsedSeconds,
            totalDuration: widget.music.duration,
          ),
        ],
      ),
    );
  }
}

class ElapsedDuration extends StatelessWidget {
  final int elapsedSeconds;
  final Duration totalDuration;
  const ElapsedDuration({
    Key key, this.elapsedSeconds, this.totalDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${elapsedSeconds ~/ 60}:${(elapsedSeconds % 60).toString().padLeft(2, '0')}'),
        Text('${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}'),
      ],
    );
  }
}
