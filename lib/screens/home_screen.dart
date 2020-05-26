import 'package:flutter/material.dart';
import 'package:todotest/widgets/welcoming_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int taskCount = 0;
    String userInput = "";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "To-do one more",
              style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Color(0xFF2E5BFF), shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  "3",
                  style: TextStyle(fontSize: 20.0),
                )),
              ),
            ]),
        body: Stack(
          children: <Widget>[
            taskCount == 0
                ? Positioned(
                    top: screenSize.height / 3.5, child: WelcomingContainer())
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return;
                    },
                  ),
            Positioned(
              bottom: 0.0,
              child: bottomComponents(screenSize, taskCount, userInput),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomComponents(Size screenSize, int taskCount, String userInput) {
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
              child: TextFormField(
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
                  userInput = value;
                },
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 11.0, horizontal: 18.0),
                decoration: BoxDecoration(
                    color: Color(0xFF2E5BFF), shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
