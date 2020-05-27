import 'package:flutter/material.dart';

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
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: 10.0, vertical: index == tasks.length ? 30 : 5),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xFFf1e3cb),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tasks.elementAt(index).taskTitle,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(tasks.elementAt(index).timeLeft,
                    style: TextStyle(fontSize: 18.0)),
              ),
            ],
          ),
        );
      },
    );
  }
}
