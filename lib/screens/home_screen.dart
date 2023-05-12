import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:fintechasia_news_app/widgets/carousel_slider.dart';
import 'package:fintechasia_news_app/widgets/notification_component.dart';
import 'package:fintechasia_news_app/widgets/search_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    // final newsArticles = Provider.of<NewsProvider>(context).newsArticles;
    final headlineArticles =
        Provider.of<NewsProvider>(context).headlineArticles;
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [SearchBar(), NotificationAlert()],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Latest News",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                        SizedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("See All"),
                                Icon(Icons.arrow_forward),
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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
