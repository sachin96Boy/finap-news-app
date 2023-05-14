import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:fintechasia_news_app/models/source_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final newsId = args['id'] as String;
    final selectedArticle = Provider.of<NewsProvider>(context).findById(newsId);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(selectedArticle.imageUrl, scale: 1.0),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    const SizedBox(
                      width: double.maxFinite,
                      height: 350.0,
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 40.0,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black26,
                    backgroundBlendMode: BlendMode.darken,
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 330.0,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                width: MediaQuery.of(context).size.width,
                height: 500.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedArticle.source.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(selectedArticle.content,
                        style: const TextStyle(fontSize: 16.0))
                  ],
                )),
              ))
        ]),
      ),
    );
  }
}
