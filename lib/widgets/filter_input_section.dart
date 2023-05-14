import 'package:flutter/material.dart';

class FilterInputSection extends StatefulWidget {
  const FilterInputSection({super.key});

  @override
  State<FilterInputSection> createState() => _FilterInputSectionState();
}

class _FilterInputSectionState extends State<FilterInputSection> {
  var selectedIndex = 0;
  List<String> customFilters = [
    'Recommend',
    'Latest',
    'Most Viewed',
    'Channel',
    'Following'
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Filter'),
              InkWell(
                child: Row(children: const [
                  Icon(Icons.delete_outline),
                  Text('Reset')
                ]),
              )
            ],
          ),
          Column(
            children: [
              const Text('Sort By'),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  padding: const EdgeInsets.all(5.0),
                  children: List.generate(customFilters.length, (index) {
                    return InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: index == selectedIndex
                              ? Colors.red
                              : Colors.grey[200],
                        ),
                        child: Center(
                          child: Text(
                            customFilters[index],
                            style: TextStyle(
                                color: index == selectedIndex
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }))
            ],
          )
        ]),
      ),
    );
  }
}
