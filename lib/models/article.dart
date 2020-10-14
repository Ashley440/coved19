import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class Article {
  final String headline;
  final String imageLink;
  List<String> _content;
  final String readmore;

  Article({this.headline, this.imageLink, this.readmore});

  Future<void> getArticleContent() async {
    var response = await http.get(readmore);
    dom.Document articleContent = parser.parse(response.body);
    var paragraphs = articleContent
        .getElementsByClassName('post-content')[0]
        .getElementsByTagName("p");
    // Setting content
    _content = [];
    for (int i = 0; i < paragraphs.length - 2; i++) {
      _content.add(paragraphs[i].innerHtml);
    }
    // print(_content);
  }

  Widget display() {
    return Card(
        child: ExpandablePanel(
            header: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Row(
                children: [
                  Expanded(
                    child: imageLink != null
                        ? Image.network(imageLink)
                        : Container(
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
                    _content == null
                        ? Center(
                            child: Text("loading article...",
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          )
                        : Text(
                            _content.join("\n\n"),
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 16, letterSpacing: 1.2, height: 1.5),
                            textAlign: TextAlign.justify,
                          ),
                    // SizedBox(height: 25),
                    // // Insert link widget that takes you directly to page
                  ],
                ))));
  }
}
