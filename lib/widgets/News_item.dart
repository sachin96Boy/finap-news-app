import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';

class NewsItem extends StatelessWidget {
  final String? imageUrl;
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
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              '$imageUrl',
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
              height: 130.0,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const SizedBox(
                    height: 130.0,
                    width: double.infinity,
                    child: Icon(Icons.broken_image_outlined),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 5.0,
            bottom: 5.0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mr $author',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(publishedAt.format(pattern),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
