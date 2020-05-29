import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todotest/model/task.dart';
import 'package:todotest/service/timer.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
    @required ScrollController scrollController,
    @required this.tasks,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
        );
      });
    }

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      addAutomaticKeepAlives: true,
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var currentElement = tasks.elementAt(index);
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: 10.0, vertical: index == tasks.length ? 30 : 5),
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                currentElement.taskTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: currentElement.withDeadline
                    ? ClockWidget(
                        currentElement.hour,
                        currentElement.minute,
                        index,
                        tasks,
                      )
                    : Text(currentElement.withoutDeadline),
              ),
            ],
          ),
        );
      },
    );
  }
}
