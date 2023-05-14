import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/search_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: TextField(
                  controller: textController,
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Enter to search"),
                  onChanged: (value) {
                    // logic when changing
                  },
                  onSubmitted: (value) {
                    // do
                    Provider.of<NewsProvider>(context, listen: false)
                        .fetchAndSetsearchedNewsArticles(value)
                        .then((_) {
                      textController.clear();
                      Navigator.of(context).pushReplacementNamed(
                          SearchScreen.routeName,
                          arguments: {
                            'searchTerm': value,
                          });
                    });
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      // search logic when pressed
                      textController.clear();
                    },
                    icon: const Icon(Icons.search)),
              )
            ]),
      ),
    );
  }
}
