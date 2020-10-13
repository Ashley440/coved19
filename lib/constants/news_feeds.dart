import 'package:coved19/models/article.dart';
import 'package:flutter/material.dart';

class NewsFeeds extends StatefulWidget {
  @override
  _NewsFeedsState createState() => _NewsFeedsState();
}

class _NewsFeedsState extends State<NewsFeeds> {
  List<Article> articles = [
    Article(
      headline:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
      content: [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "A iaculis at erat pellentesque adipiscing commodo elit at imperdiet. Amet purus gravida quis blandit. Quam pellentesque nec nam aliquam sem et tortor consequat. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi quis eleifend quam adipiscing. Nulla aliquet porttitor lacus luctus. Consectetur adipiscing elit pellentesque habitant morbi tristique. Erat velit scelerisque in dictum non consectetur a erat nam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Nec ultrices dui sapien eget mi proin. Ut placerat orci nulla pellentesque dignissim enim sit. Accumsan sit amet nulla facilisi. Et tortor consequat id porta nibh venenatis."
      ],
      readmore: "",
    ),
    Article(
      headline: "Elementum facilisis leo vel fringilla",
      content: [
        "A iaculis at erat pellentesque adipiscing commodo elit at imperdiet. Amet purus gravida quis blandit. Quam pellentesque nec nam aliquam sem et tortor consequat. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper eget. Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi quis eleifend quam adipiscing. Nulla aliquet porttitor lacus luctus. Consectetur adipiscing elit pellentesque habitant morbi tristique. Erat velit scelerisque in dictum non consectetur a erat nam. Porttitor leo a diam sollicitudin tempor id eu nisl nunc. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Nec ultrices dui sapien eget mi proin. Ut placerat orci nulla pellentesque dignissim enim sit. Accumsan sit amet nulla facilisi. Et tortor consequat id porta nibh venenatis."
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      ],
      readmore: "",
    ),
    Article(
      headline:
          "Tortor vitae purus faucibus ornare. Sollicitudin tempor id eu nisl",
      content: [
        "Ac turpis egestas sed tempus urna et pharetra pharetra massa. Gravida neque convallis a cras semper auctor neque vitae tempus. Lobortis feugiat vivamus at augue eget arcu dictum. Maecenas volutpat blandit aliquam etiam erat velit scelerisque in. Justo eget magna fermentum iaculis eu non diam phasellus. Arcu bibendum at varius vel pharetra vel turpis nunc. Tortor posuere ac ut consequat semper. Ac auctor augue mauris augue. Tortor vitae purus faucibus ornare. Sollicitudin tempor id eu nisl. Sed odio morbi quis commodo odio aenean sed. Nunc sed id semper risus in hendrerit gravida rutrum quisque. Neque ornare aenean euismod elementum nisi quis eleifend quam. Nibh cras pulvinar mattis nunc sed blandit libero. Sit amet facilisis magna etiam tempor. Eu consequat ac felis donec et. Risus in hendrerit gravida rutrum. Fermentum posuere urna nec tincidunt. Fames ac turpis egestas maecenas pharetra convallis posuere morbi.",
        "Maecenas pharetra convallis posuere morbi leo urna molestie at elementum. Condimentum id venenatis a condimentum. Nam at lectus urna duis convallis convallis tellus id. Cursus euismod quis viverra nibh. Malesuada fames ac turpis egestas integer eget aliquet. Odio pellentesque diam volutpat commodo. Vel facilisis volutpat est velit. Facilisi cras fermentum odio eu. Tortor vitae purus faucibus ornare. Risus in hendrerit gravida rutrum quisque non tellus. Aliquam sem et tortor consequat id porta nibh venenatis cras. Cursus eget nunc scelerisque viverra mauris. Amet massa vitae tortor condimentum lacinia quis."
      ],
      readmore: "",
    ),
  ];

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
