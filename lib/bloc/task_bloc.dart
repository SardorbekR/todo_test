import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:todotest/bloc/event_state_bloc.dart';

class TaskBloc {
  final _taskStateController = BehaviorSubject<TaskState>();

  Stream<TaskState> get item => _taskStateController.stream;

  TaskState get initialState => TaskInitialState();

  final _taskEventController = StreamController<TaskEvent>();

  Sink<TaskEvent> get taskEventSink => _taskEventController.sink;

  void addEvent(TaskEvent event) => _taskEventController.sink.add(event);

  TaskItemBloc(){
    _taskEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TaskEvent event) {

  }

  void dispose() {
    _taskStateController.close();
    _taskEventController.close();
  }
}
