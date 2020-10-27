import 'dart:math';

import 'package:coved19/views/full_article.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class Article {
  final String headline;
  final String imageLink;
  final String readmore;
  String _content;
  String _date;
  Article({this.headline, this.imageLink, this.readmore});

  Future<void> getArticleContent() async {
    var response = await http.get(readmore);
    dom.Document articleContent = parser.parse(response.body);
    String paragraphs =
        articleContent.getElementsByClassName('post-content')[0].innerHtml;
    _date = articleContent
        .getElementsByClassName('fusion-meta-info-wrapper')[0]
        .getElementsByTagName('span')[1]
        .innerHtml;
    _content = paragraphs;
  }

  Widget display(BuildContext context) {
    return ExpandablePanel(
        // ignore: deprecated_member_use
        hasIcon: false,
        header: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                  child: Wrap(
                    children: [
                      Text(
                        headline,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(_date),
                    ],
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
                    : Html(
                        data: _content.substring(0, min(600, _content.length)) +
                            "...",
                      ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullArticle(
                              headline: headline,
                              imageLink: imageLink,
                              date: _date,
                              content: _content))),
                  child: Text(
                    "read more",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blueAccent),
                  ),
                )
              ],
            )));
  }
}
