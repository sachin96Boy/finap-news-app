import 'package:flutter/material.dart';

class HeadlineItems extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String title;
  final String desc;

  const HeadlineItems(
      {super.key,
      required this.imageUrl,
      required this.author,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        margin: const EdgeInsets.all(5.0),
        child: Stack(children: [
          Image.network(
            imageUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
              child: Column(children: [
            Text(
              'by $author',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 16.0),
            )
          ]))
        ]),
      ),
    );
  }
}
