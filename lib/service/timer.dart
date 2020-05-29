import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:todotest/model/task.dart';

class ClockWidget extends StatelessWidget {
  final int hour, minute, index;
  List<Task> tasks;

  ClockWidget(this.hour, this.minute, this.index, this.tasks);

  @override
  Widget build(BuildContext context) {
    bool isTaskFinished = false;

    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      DateTime now = DateTime.now();

      int h,
          m,
          s; //Remained hour, remained minute, remained second till the deadline

      Duration timeLeft =
          DateTime(now.year, now.month, now.day, hour, minute).difference(now);

      if (timeLeft.inHours <= 0 && timeLeft.inMinutes < 0) {
        timeLeft = DateTime(now.year, now.month, now.day, hour, minute)
            .difference(now.subtract(Duration(seconds: 86400)));
      } else if (hour == now.hour && minute == now.minute) {
        timeLeft = DateTime(now.year, now.month, now.day, hour, minute)
            .difference(now.subtract(Duration(seconds: 86400)));
      }

      h = timeLeft.inHours;
      m = timeLeft.inMinutes % 60;
      s = timeLeft.inSeconds % 60;

      if (timeLeft.inHours <= 0 && timeLeft.inMinutes <= 0 && s == 0) {
        isTaskFinished = true;
        tasks.elementAt(index).withDeadline = false;
        tasks.elementAt(index).withoutDeadline = "Время вышло!";
        tasks.elementAt(index).sortingIndex = -timeLeft.inMilliseconds;

        tasks.sort((a, b) => a.sortingIndex.compareTo(b.sortingIndex));
      }

      return isTaskFinished
          ? Text("Время вышло!")
          : Text("$h ч. $m мин. $s сек осталось");
    });
  }
}
