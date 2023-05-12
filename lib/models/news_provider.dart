import 'dart:convert';

import 'package:fintechasia_news_app/models/article_model.dart';
import 'package:fintechasia_news_app/models/source_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> _newsArticles;

  NewsProvider(this._newsArticles);

  List<Article> get newsArticles {
    return [..._newsArticles];
  }

  Future<void> fetchAndSetNewsArticles() async {
    var url = dotenv.env['NEWS_API'] as String;
    try {
      final newsResponse = await http.get(
          Uri.parse('$url?domains=techcrunch.com,thenextweb.com'),
          headers: {"Authorization": dotenv.env['AUTH_NEWS_API'] as String});
      final responseData =
          json.decode(newsResponse.body) as Map<String, dynamic>;
      var articleList = responseData['articles'] as List<dynamic>;
      final List<Article> loadedNewsArticles = [];
      for (var element in articleList) {
        loadedNewsArticles.add(
          Article(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            imageUrl: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            source: Source(
              id: element['source']['id'],
              name: element['source']['name'],
            ),
          ),
        );
      }
      _newsArticles = loadedNewsArticles;
      print(newsArticles[0].title);
    } catch (err) {
      throw (err);
    }
  }
}
