class Task {
  String _taskTitle, withoutTime;
  int hour, minute;
  bool withTime;

  Task(this._taskTitle, this.withTime,
      [this.withoutTime, this.hour, this.minute]);

  String get taskTitle => _taskTitle;
}
