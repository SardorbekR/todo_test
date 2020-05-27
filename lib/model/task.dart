class Task {
  String _taskTitle, _timeLeft;

  Task(this._taskTitle, this._timeLeft);

  get timeLeft => _timeLeft;

  String get taskTitle => _taskTitle;
}
