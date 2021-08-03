import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/map/mapdata.dart';

bool isChecked = false;

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
        title: Text('Google Map'),
      ),
      body: GoogleMap(
          myLocationEnabled: true,
          markers: {
            Marker(
                infoWindow:
                    InfoWindow(title: 'CUDDALORE', snippet: latLng.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta),
                position: latLng,
                markerId: MarkerId('CUDDALORE')),
            Marker(
                infoWindow:
                    InfoWindow(title: 'CHENNAI', snippet: latLng2.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                position: latLng2,
                markerId: MarkerId('CHENNAI')),
            Marker(
                infoWindow: InfoWindow(
                    title: 'PUDHUCHERRY', snippet: latLng3.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet),
                position: latLng3,
                markerId: MarkerId('PUDHUCHERRY')),
            Marker(
                infoWindow:
                    InfoWindow(title: 'HARYANA', snippet: latLng4.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
                position: latLng4,
                markerId: MarkerId('HARYANA')),
            Marker(
                infoWindow:
                    InfoWindow(title: 'TRIPURA', snippet: latLng5.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueCyan),
                position: latLng5,
                markerId: MarkerId('TRIPURA')),
          },
          mapType: MapType.normal,
          onMapCreated: onMapCreated,
          initialCameraPosition:
              CameraPosition(tilt: 74, zoom: 9, target: latLng)),
    );
  }
}
