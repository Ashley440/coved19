import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Lesson {
  final String question;
  final String answer;
  // final String source;
  String imageLink;
  Lesson({this.question, this.answer, this.imageLink});

  Widget display() {
    return Card(
        child: ListTile(
      leading: Container(
        width: 100,
        height: 100,
        child: Image.asset()
      ),
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      contentPadding: EdgeInsets.all(25),
      subtitle: Text(
        "\n$answer",
        style: TextStyle(color: Colors.grey),
      ),
    ));
  }
}
