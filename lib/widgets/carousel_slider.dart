import 'package:carousel_slider/carousel_slider.dart';
import 'package:fintechasia_news_app/models/article_model.dart';
import 'package:fintechasia_news_app/screens/news_details_screen.dart';
import 'package:fintechasia_news_app/widgets/headline_items.dart';
import 'package:flutter/material.dart';

class CarasoulSlider extends StatelessWidget {
  final List<Article> headlineNewsitemList;
  const CarasoulSlider({super.key, required this.headlineNewsitemList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: headlineNewsitemList.length,
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIndex) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
            NewsDetailsScreen.routeName,
            arguments: {"id": headlineNewsitemList[index].id}),
        child: HeadlineItems(
            imageUrl: headlineNewsitemList[index].imageUrl,
            author: headlineNewsitemList[index].author,
            title: headlineNewsitemList[index].title,
            desc: headlineNewsitemList[index].description),
      ),
    );
  }
}
