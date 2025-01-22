import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'favourites screen',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
