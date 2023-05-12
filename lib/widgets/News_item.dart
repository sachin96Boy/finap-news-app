import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final DateTime publishedAt;

  const NewsItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  height: 130.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 20.0,
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(author),
                  Text(publishedAt as String),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
