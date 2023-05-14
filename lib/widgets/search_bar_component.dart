import 'package:flutter/material.dart';

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
                    Navigator.of(context).pushReplacementNamed(
                        SearchScreen.routeName,
                        arguments: {
                          'searchTerm': value,
                        });
                    textController.clear();
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
