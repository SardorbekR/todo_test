import 'package:flutter/material.dart';

class Task {
  String taskTitle, withoutDeadline;
  int hour, minute;
  bool withDeadline;
  int sortingIndex = -1;

  Task(
      {@required this.taskTitle,
      @required this.withDeadline,
      this.withoutDeadline,
      this.hour,
      this.minute,
      this.sortingIndex});
}
