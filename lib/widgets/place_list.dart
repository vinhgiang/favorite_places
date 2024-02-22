import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  final List<Place> places;

  const PlaceList({
    super.key,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        'No places added yet.',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              places[index].name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          );
        },
      );
    }

    return content;
  }
}
