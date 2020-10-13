import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Article {
  final String headline;
  // final String imageLink;
  final List<String> content;
  final String readmore;

  Article({this.headline, this.content, this.readmore});

  Widget display() {
    return Card(
        child: ExpandablePanel(
            header: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Row(
                children: [
                  // Image.network(imageLink),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      // width: 50,
                      height: 80,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        headline,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                ],
              ),
            ),
            expanded: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      content.join("\n\n"),
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 1.2, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 25),
                    // Insert link widget that takes you directly to page
                  ],
                ))));
  }
}
