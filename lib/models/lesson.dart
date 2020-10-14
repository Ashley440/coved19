import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Lesson {
  final String question;
  final List<String> answer;
  final String source;
  Lesson({this.question, this.answer, this.source});

  Widget display() {
    return Card(
      child: ExpandablePanel(
        header: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.redAccent, width: 5.0))),
            child: Text(
              question,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
        expanded: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                answer.join("\n\n"),
                softWrap: true,
                style: TextStyle(fontSize: 16, letterSpacing: 1.2, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "source:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(flex: 4, child: Text(source, softWrap: true)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
