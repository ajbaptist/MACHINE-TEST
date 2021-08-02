import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/map/mapdata.dart';

bool isChecked = false;

double lat = 0;
double lng = 0;
LatLng mylocation = LatLng(lat, lng);

class SimpleMap extends StatefulWidget {
  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  GoogleMapController? controller;

  void onMapCreated(GoogleMapController googleMapController) {
    controller = googleMapController;
  }

  Future<void> future() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    setState(() {
      lat = position.latitude;
      lng = position.longitude;
      isChecked = true;
      controller!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(zoom: 10, target: mylocation)));

      print({mylocation, isChecked});
    });
  }

  @override
  void initState() {
    future();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          future();
        },
        child: Icon(Icons.my_location),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('GOOGLE MAP'),
      ),
      body: GoogleMap(
          markers: {
            tnMarker,
            tlMarker,
            hrMarker,
            mpMarker,
            tpMarker,
            if (isChecked == true) tnMarker1
          },
          mapType: MapType.normal,
          onMapCreated: onMapCreated,
          initialCameraPosition:
              CameraPosition(tilt: 74, zoom: 4, target: latLng3)),
    );
  }
}
