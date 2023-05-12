import 'dart:convert';

import 'package:fintechasia_news_app/models/article_model.dart';
import 'package:fintechasia_news_app/models/source_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> _newsArticles;
  List<Article> _headlineArticles;

  NewsProvider(this._newsArticles, this._headlineArticles);

  List<Article> get newsArticles {
    return [..._newsArticles];
  }

  List<Article> get headlineArticles {
    return [..._headlineArticles];
  }

  Future<void> fetchAndSetNewsArticles() async {
    var url = dotenv.env['NEWS_API_EVERYTHING'] as String;
    var headlineurl = dotenv.env['NEWS_API_HEADLINES'] as String;
    var headers = {"Authorization": dotenv.env['AUTH_NEWS_API'] as String};
    try {
      final newsResponse = await http.get(
          Uri.parse('$url?domains=techcrunch.com,thenextweb.com'),
          headers: headers);
      final headlineResponse = await http.get(
          Uri.parse('$headlineurl?country=us'),
          headers: headers);

      if (headlineResponse.statusCode == 200) {
        final responseData =
            json.decode(newsResponse.body) as Map<String, dynamic>;
        final headlineResponseData =
            json.decode(headlineResponse.body) as Map<String, dynamic>;

        var articleList = responseData['articles'] as List<dynamic>;
        var headlineArticleList =
            headlineResponseData['articles'] as List<dynamic>;
        
        final List<Article> loadedNewsArticles = [];
        final List<Article> loadedHeadlineArticles = [];
        for (var element in headlineArticleList) {
          loadedHeadlineArticles.add(
            Article(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              imageUrl: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
              // source: Source(
              //   id: element['source']['id'],
              //   name: element['source']['name'],
              // ),
            ),
          );
        }
        for (var element in articleList) {
          loadedNewsArticles.add(
            Article(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              imageUrl: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
        //       source: Source(
        //         id: element['source']['id'],
        //         name: element['source']['name'],
        //       ),
            ),
          );
        }
        _newsArticles = loadedNewsArticles;
        _headlineArticles = loadedHeadlineArticles;
        notifyListeners();
      } else {
        throw Exception("data not fetched");
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
