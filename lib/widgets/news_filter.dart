import 'package:flutter/material.dart';

class NewsFilter extends StatefulWidget {
  const NewsFilter({super.key});

  @override
  State<NewsFilter> createState() => _NewsFilterState();
}

class _NewsFilterState extends State<NewsFilter> {
  var selectedIndex = 0;

  void selectItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filters = ['category', 'language', 'country'];
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => selectItem(index),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: index == selectedIndex ? Colors.red : Colors.grey[200],
            ),
            child: Center(
              child: Text(
                filters[index],
                style: TextStyle(
                    color:
                        index == selectedIndex ? Colors.white : Colors.black),
              ),
            ),
          ),
        );
      },
      itemCount: filters.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
