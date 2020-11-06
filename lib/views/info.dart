import 'package:carousel_pro/carousel_pro.dart';
import 'package:coved19/models/lesson.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<Lesson> lessons = [
    Lesson(
        imageLink: "assets/images/wash_hands.jpg",
        question: "Wash your hands",
        answer:
            "Wash hands with soap and water for at least 20 seconds or use a hand sanitizer with at least 60% alcohol. Dry them thoroughly with an air dryer or clean towel."),
    Lesson(
        imageLink: "assets/images/no_touch.jpg",
        question: "Avoid touching face",
        answer:
            "Avoid touching nose, eyes, and mouth. Use a tissue to cover a cough or sneeze, then dispose of it in the trash."),
    Lesson(
        imageLink: "assets/images/wear_mask.jpg",
        question: "Wear a mask",
        answer:
            "Wearing a mask prevents you from spreading the virus and it prevents you from getting it."),
    Lesson(
        imageLink: "assets/images/cover_up.jpg",
        question: "Use elbow",
        answer:
            "Using the bend of your elbow when coughing / sneezing prevents the germs from getting onto your hands and in turn from surfaces.")
  ];

  @override
  Widget build(BuildContext context) {
    const double spacing = 25;
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.white,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/covid.JPG",
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 25),
                    Text("What is COVID19?",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                    SizedBox(height: 5),
                    Text(
                      "Coronavirus disease 2019 is an infectious disease caused by severe acute respiratory syndrome coronavirus 2",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing),
            Text(
              "Symptoms",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Card(
              elevation: 1,
              child: Container(
                  padding: EdgeInsets.all(15),
                  height: 300,
                  child: Carousel(
                    images: [
                      for (int i = 0; i < 4; i++)
                        Image.asset("assets/images/$i.jpg")
                    ],
                    boxFit: BoxFit.cover,
                    showIndicator: false,
                  )),
            ),
            SizedBox(height: spacing),
            Text(
              "Precautions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            // SizedBox(height: 5),
            for (Lesson lesson in lessons)
              lesson.display(screenSize.height * .25),
          ],
        ),
      ),
    );
  }
}
