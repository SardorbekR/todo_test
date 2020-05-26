import 'package:flutter/material.dart';

class WelcomingContainer extends StatelessWidget {
  const WelcomingContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color(0xFFEDF4F8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 4.0,
              offset: Offset(0.0, 3.0),
            ),
          ],
        ),
        width: 385,
        height: 155,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Вы впервые?",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Вы можете добавить напоминание снизу. Используйте формат “12:00 сходить в магазин”, чтобы задать напоминание по времени",
              style: TextStyle(
                color: Color(0xCC2C2C2C),
                fontSize: 17.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
