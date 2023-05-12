import 'package:fintechasia_news_app/widgets/notification_component.dart';
import 'package:fintechasia_news_app/widgets/search_bar_component.dart';
import 'package:flutter/material.dart';

class Homecreen extends StatelessWidget {
  const Homecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              SizedBox(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("See All"),
                      Icon(Icons.arrow_forward),
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
