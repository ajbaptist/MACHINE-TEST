import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/map/mapdata.dart';

class SimpleMap extends StatefulWidget {
  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  GoogleMapController? controller;

  void onMapCreated(GoogleMapController googleMapController) {
    controller = googleMapController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GOOGLE MAP'),
      ),
      body: GoogleMap(
          markers: {tnMarker, tlMarker, hrMarker, mpMarker, tpMarker},
          mapType: MapType.satellite,
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            zoom: 4,
            target: latLng3,
          )),
    );
  }
}
