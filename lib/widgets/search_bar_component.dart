import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Enter to search"),
                  onChanged: (value) {
                    // logic when changing
                  },
                  onSubmitted: (value) {
                    // do something
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      // search logic when pressed
                    },
                    icon: const Icon(Icons.search)),
              )
            ]),
      ),
    );
  }
}
