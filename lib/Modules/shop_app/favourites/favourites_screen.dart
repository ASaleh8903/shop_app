import 'package:flutter/cupertino.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Screen',
        style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}