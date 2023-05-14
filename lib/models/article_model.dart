import 'package:fintechasia_news_app/models/source_model.dart';

class Article {
  final String id;
  final String author;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;
  final Source source;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
    required this.source,
  });
}
