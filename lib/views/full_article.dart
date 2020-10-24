import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FullArticle extends StatelessWidget {
  final String headline;
  final String imageLink;
  final String content;
  final String date;

  FullArticle({this.headline, this.date, this.imageLink, this.content});

  nested() => NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              floating: false,
              elevation: 0,
              backgroundColor: Colors.white,
              pinned: false,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                imageLink,
                fit: BoxFit.cover,
              )),
            )
          ],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headline,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 5),
              Text(
                "Written on | $date",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Html(
                data: content,
              ),
            ],
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        // ),
        body: nested()
        // SingleChildScrollView(
        //     child: Container(
        //   padding: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       Image.network(imageLink),
        //       Text(headline,
        //           softWrap: true,
        //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        //       Html(
        //         data: content,
        //       ),
        //     ],
        //   ),
        // )),
        );
  }
}
