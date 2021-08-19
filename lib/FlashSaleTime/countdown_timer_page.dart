import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'countdown_timer_controller.dart';
import 'current_remaining_time.dart';
import 'flutter_countdown_timer.dart';

class CountdownTimerPage extends StatefulWidget {
  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch +
      Duration(hours: 1, minutes: 0, seconds: 10).inMilliseconds;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {}

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      textStyle: TextStyle(
        fontSize: 15,
        color: Colors.red,
      ),
      onEnd: onEnd,
      endTime: endTime,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
