import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';

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
    const pattern = 'yMMMd';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: Stack(
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
                horizontal: 10.0,
              ),
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mr $author',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(publishedAt.format(pattern),
                      style: const TextStyle(color: Colors.white)),
                ],
              ))
        ],
      ),
    );
  }
}
