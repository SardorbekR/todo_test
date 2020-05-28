import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class ClockWidget extends StatelessWidget {
  final int hour, minute;

  ClockWidget(this.hour, this.minute);

  @override
  Widget build(BuildContext context) {
    bool isTaskFinished = false;

    return TimerBuilder.periodic(Duration(seconds: 1), //updates every second
        builder: (context) {
      DateTime now = DateTime.now();
      int remainedMin;
      int remainedHour = hour - now.hour - 1;
      int seconds = 59 - now.second;

      if (minute - now.minute < 0) {
        remainedMin = (60 - now.minute) + minute;
      } else {
        remainedMin = minute - now.minute - 1;
      }

      if (remainedHour < 0 && minute - now.minute < 0) {
        //Task deadline is tomorrow
        remainedHour += 24;
      }

      if ((remainedHour == 0 && remainedMin <= 0 && seconds == 0) ||
          remainedMin < 0) {
        isTaskFinished = true;
      }

      return isTaskFinished
          ? Text("Время вышло!")
          : Text(
              "${remainedHour < 0 ? remainedHour = 0 : remainedHour} ч. $remainedMin мин. $seconds сек осталось");
    });
  }
}
