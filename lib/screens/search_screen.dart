import 'package:fintechasia_news_app/models/article_model.dart';
import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:fintechasia_news_app/widgets/filter_input_section.dart';
import 'package:fintechasia_news_app/widgets/news_item_list.dart';
import 'package:fintechasia_news_app/widgets/search_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/news_filter.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void _showModelFromBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: const FilterInputSection(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final searchTerm = args['searchTerm'] as String;

    final searchedArticleList = Provider.of<NewsProvider>(context).newsArticles;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [SearchBar()],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(children: [
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _showModelFromBottom(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.filter_alt_outlined),
                        Text('Filter')
                      ],
                    ),
                  ),
                  const Flexible(
                      child: SizedBox(height: 50, child: NewsFilter()))
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                'About ${searchedArticleList.length.round()} results for $searchTerm'),
            const SizedBox(
              height: 10.0,
            ),
            NewsItemList(newsArticles: searchedArticleList)
          ]),
        ),
      ),
    );
  }
}
