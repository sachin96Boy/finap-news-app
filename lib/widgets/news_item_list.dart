import 'package:fintechasia_news_app/models/article_model.dart';
import 'package:fintechasia_news_app/screens/news_details_screen.dart';
import 'package:fintechasia_news_app/widgets/news_item.dart';
import 'package:flutter/material.dart';

class NewsItemList extends StatelessWidget {
  final List<Article> newsArticles;
  const NewsItemList({super.key, required this.newsArticles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(NewsDetailsScreen.routeName, arguments: {
          "id": newsArticles[index].id
        }),
        child: NewsItem(
          author: newsArticles[index].author,
          imageUrl: newsArticles[index].imageUrl,
          publishedAt: newsArticles[index].publishedAt,
          title: newsArticles[index].title,
        ),
      ),
      itemCount: newsArticles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
