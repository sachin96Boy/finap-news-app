import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:fintechasia_news_app/widgets/carousel_slider.dart';
import 'package:fintechasia_news_app/widgets/news_item_list.dart';
import 'package:fintechasia_news_app/widgets/notification_component.dart';
import 'package:fintechasia_news_app/widgets/search_bar_component.dart';
import 'package:fintechasia_news_app/screens/news_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/news_filter.dart';

class Homecreen extends StatefulWidget {
  const Homecreen({super.key});

  @override
  State<Homecreen> createState() => _HomecreenState();
}

class _HomecreenState extends State<Homecreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<NewsProvider>(context).fetchAndSetNewsArticles().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void selectSection(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(NewsListScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final newsArticles = Provider.of<NewsProvider>(context).newsArticles;
    final headlineArticles =
        Provider.of<NewsProvider>(context).headlineArticles;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: SafeArea(
          top: true,
          child: SizedBox(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SearchBarCustom(), NotificationAlert()],
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Latest News",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                        InkWell(
                          onTap: () => selectSection(context),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "See All",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Icon(Icons.arrow_forward, color: Colors.blue),
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CarasoulSlider(
                          headlineNewsitemList: headlineArticles),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: NewsFilter(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    NewsItemList(newsArticles: newsArticles)
                  ],
                ),
              ),
            ),
    );
  }
}
