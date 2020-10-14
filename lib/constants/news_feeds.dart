import 'package:coved19/models/article.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class NewsFeeds extends StatefulWidget {
  @override
  _NewsFeedsState createState() => _NewsFeedsState();
}

class _NewsFeedsState extends State<NewsFeeds> {
  List<Article> articles = [];

  Future<void> getArticles() async {
    String link = "https://sacoronavirus.co.za/category/in-the-media/";
    var response = await http.get(link);
    dom.Document newsWebPage = parser.parse(response.body);
    for (int i = 0; i < 5; i++) {
      var articleBlock = newsWebPage.getElementsByTagName("article")[i];
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
    // Updating the articles on page
    setState(() {
      articles = articles;
    });
  }

  @override
  void initState() {
    getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          "Latest news",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Column(children: articles.map((article) => article.display()).toList()),
      ],
    ));
  }
}
