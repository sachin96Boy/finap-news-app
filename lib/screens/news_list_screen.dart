import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:fintechasia_news_app/widgets/news_item_list.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class NewsListScreen extends StatelessWidget {
  static const routeName = '/news-list-screen';
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfArticles = Provider.of<NewsProvider>(context).allArticles;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "News List",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.black,
                      ))
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: NewsItemList(
          newsArticles: listOfArticles,
        ),
      ),
    );
  }
}
