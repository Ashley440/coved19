import 'package:coved19/models/article.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

// ignore: must_be_immutable
class NewsFeeds extends StatefulWidget {
  List<Article> articles = [];

  Future<void> getLatestArticles() async {
    String link = "https://sacoronavirus.co.za/category/in-the-media/";
    var response = await http.get(link);
    dom.Document newsWebPage = parser.parse(response.body);
    var currentArticles = newsWebPage.getElementsByTagName("article");
    for (int i = 0; i < currentArticles.length; i++) {
      var articleBlock = currentArticles[i];
      var articleImage =
          articleBlock.getElementsByTagName("img")[0].attributes["src"];
      var articleLink = articleBlock.getElementsByTagName("a")[0];
      Article article = Article(
          headline: articleLink.text,
          imageLink: articleImage,
          readmore: articleLink.attributes["href"]);
      await article.getArticleContent();
      articles.add(article);
    }
  }

  @override
  _NewsFeedsState createState() => _NewsFeedsState();
}

class _NewsFeedsState extends State<NewsFeeds> {
  int _maxArticlesDisplayed = 3;

  @override
  void initState() {
    // Updating the articles on page
    setState(() {
      widget.articles = widget.articles;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "In the media",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("view"),
                  DropdownButton(
                    onChanged: (value) => setState(
                        () => _maxArticlesDisplayed = int.parse(value)),
                    items: ["3", "5", "7", "10"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                  )
                ],
              ),
              Divider(
                height: 0,
                color: Colors.black,
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Column(children: [
                for (int i = 0; i < _maxArticlesDisplayed; i++)
                  Column(
                    children: [
                      widget.articles[i].display(context),
                      Divider(
                        color: Colors.grey[400],
                        height: 3,
                      ),
                    ],
                  )
              ]),
            ],
          )),
    );
  }
}
