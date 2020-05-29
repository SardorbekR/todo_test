import 'package:flutter/material.dart';
import 'package:todotest/model/task.dart';
import 'package:todotest/widgets/appBar.dart';
import 'package:todotest/widgets/task_list.dart';
import 'package:todotest/widgets/welcoming_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();
  DateTime now = DateTime.now();
  List<Task> tasks = List();
  String userInput = "";
  int taskCount = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "To-do one more",
              style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
            actions: [AppBarComponents(taskCount: taskCount)]),
        body: Stack(
          children: <Widget>[
            taskCount == 0
                ? Positioned(
                    top: screenSize.height / 3.5, child: WelcomingContainer())
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: TaskList(
                            scrollController: _scrollController, tasks: tasks),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 120,
                        child: Text(
                          "Это все задания на сегодня!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomComponents(screenSize),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomComponents(Size screenSize) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 4.0,
            offset: Offset(0.0, -3.0),
          ),
        ],
      ),
      width: screenSize.width,
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: SizedBox(
              height: 45,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  hintText: taskCount == 0
                      ? "12:00 Сходить в магазин"
                      : "Что еще нужно сделать?",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.green,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                },
              ),
            ),
          ),
          FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.white,
            onPressed: userInput.isNotEmpty
                ? () {
                    setState(() {
                      var parts = userInput.split(' ');
                      var prefix = parts[0].trim();

                      RegExp regExp =
                          new RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');

                      if (regExp.stringMatch(prefix) != null) {
                        String matches = regExp.stringMatch(prefix).toString();

                        var hour, minute;

                        if (identical(matches[1]?.trim(), ':')) {
                          hour = int.parse("${matches[0]?.trim()}");
                          minute = int.parse(
                              "${matches[2].trim()}${matches[3]?.trim()}");
                        } else {
                          hour = int.parse(
                              "${matches[0]?.trim()}${matches[1]?.trim()}");
                          minute = int.parse(
                              "${matches[3].trim()}${matches[4]?.trim()}");
                        }

                        assert(hour is int);
                        assert(minute is int);
                        Duration timeLeft =
                            DateTime(now.year, now.month, now.day, hour, minute)
                                .difference(now);
                        if (timeLeft.inMilliseconds < 0)
                          timeLeft = DateTime(
                                  now.year, now.month, now.day, hour, minute)
                              .difference(
                                  now.subtract(Duration(seconds: 86400)));
                        setState(() {
                          tasks.add(Task(
                              taskTitle: userInput,
                              withDeadline: true,
                              hour: hour,
                              minute: minute,
                              sortingIndex: timeLeft.inMilliseconds));

                          taskCount = tasks.length;

                          if (tasks.length > 0)
                            tasks.sort((a, b) =>
                                a.sortingIndex.compareTo(b.sortingIndex));
                        });
                      } else {
                        setState(() {
                          if (userInput.isNotEmpty)
                            tasks.add(Task(
                              taskTitle: userInput,
                              withDeadline: false,
                              withoutDeadline: "Без времени",
                              sortingIndex:
                                  -DateTime.now().millisecondsSinceEpoch,
                            ));
                          taskCount = tasks.length;
                          if (tasks.length > 0)
                            tasks.sort((a, b) =>
                                a.sortingIndex.compareTo(b.sortingIndex));
                        });
                      }
                    });
                    _textController.clear();
                    userInput = "";
                  }
                : null,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0),
              decoration: BoxDecoration(
                  color: Color(0xFF2E5BFF), shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
