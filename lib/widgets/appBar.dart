import 'package:flutter/material.dart';

class AppBarComponents extends StatelessWidget {
  const AppBarComponents({
    Key key,
    @required this.taskCount,
  }) : super(key: key);

  final int taskCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      decoration: BoxDecoration(
          color: taskCount == 0 ? Colors.white : Color(0xFF2E5BFF),
          shape: BoxShape.circle),
      child: Center(
          child: Text(
        '$taskCount',
        style: TextStyle(fontSize: 20.0),
      )),
    );
  }
}
