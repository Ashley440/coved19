import 'package:flutter/material.dart';

class Lesson {
  final String question;
  final String answer;
  // final String source;
  String imageLink;
  Lesson({this.question, this.answer, this.imageLink});

  Widget display() {
    return Card(
      elevation: 1,
        child: Container(
          height: 150,
          child: Center(
            child: ListTile(
      leading: CircleAvatar(child: Image.asset(imageLink), radius: 50),
      title: Text(
            question,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      contentPadding: EdgeInsets.all(15),
      subtitle: Text(
            "\n$answer",
            style: TextStyle(color: Colors.blueGrey[600]),
      ),
    ),
          ),
        ));
  }
}
