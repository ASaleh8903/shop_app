import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Categories Screen',
        style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
