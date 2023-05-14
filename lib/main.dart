import 'package:fintechasia_news_app/models/news_provider.dart';
import 'package:fintechasia_news_app/screens/home_screen.dart';
import 'package:fintechasia_news_app/screens/news_details_screen.dart';
import 'package:fintechasia_news_app/screens/news_list_screen.dart';
import 'package:fintechasia_news_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider([], []),
      child: MaterialApp(
        title: 'Fintech NewsApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const Homecreen(),
          NewsDetailsScreen.routeName: (context) => const NewsDetailsScreen(),
          NewsListScreen.routeName: (context) => const NewsListScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
        },
      ),
    );
  }
}
