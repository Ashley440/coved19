import 'package:coved19/constants/navigator.dart';
import 'package:coved19/models/lesson.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<Lesson> lessons = [
    Lesson(
        question: "What is covid19?",
        answer:
            "Coronavirus disease 2019 is an infectious disease caused by severe acute respiratory syndrome coronavirus 2",
        source: "Unknown"),
    Lesson(
        question: "What precautions should I take against covid19?",
        answer: "Wash your hands often\nAvoid touching your eyes, nose or mouth\nCough or sneeze in your bent elbow\nLimit social gatherings and time spent in crowded places" +
            "\nAvoid close contact with someone who is sick\nClean and disinfect frequently touched objects\nAlthough not mentioned by the World Health Organization, wearing a mask which covers the nose and mouth greatly mitigates the risks of inhaling or exhaling the virus",
        source: "World Health Organization"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CovED19")),
      ),
      body: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) => lessons[index].display()),
      bottomNavigationBar: NavigatorPane(
        screenActive: "info",
      ),
    );
  }
}
