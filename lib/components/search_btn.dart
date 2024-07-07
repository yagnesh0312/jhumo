import 'package:flutter/material.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Search"),
        ],
      ),
    );
  }
}
