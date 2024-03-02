import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation placeLocation;
  final bool isSelecting;

  const MapScreen({
    super.key,
    this.placeLocation = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Select your place' : 'Your place'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {},
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.placeLocation.latitude,
            widget.placeLocation.longitude,
          ),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('m1'),
            position: LatLng(
              widget.placeLocation.latitude,
              widget.placeLocation.longitude,
            ),
          )
        },
      ),
    );
  }
}
