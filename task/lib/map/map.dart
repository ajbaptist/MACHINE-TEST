import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  Future future() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    setState(() {
      mylocation = LatLng(position.latitude, position.longitude);
      isChecked = true;
      controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 10, target: LatLng(position.latitude, position.longitude))));

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
        onPressed: future,
        child: Icon(Icons.location_on),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Google Map'),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.refresh_sharp))],
      ),
      body: GoogleMap(
          myLocationEnabled: true,
          markers: {
            Marker(
                infoWindow: InfoWindow(
                    title: isChecked == false
                        ? 'ENSURE YOUR LOCATION'
                        : getDistance(mylocation!, latLng).toString() +
                            "KM AWAY",
                    snippet: latLng.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueMagenta),
                position: latLng,
                markerId: MarkerId('CUDDALORE')),
            Marker(
                infoWindow: InfoWindow(
                    title: isChecked == false
                        ? 'ENSURE YOUR LOCATION'
                        : getDistance(mylocation!, latLng2).toString() +
                            "KM AWAY",
                    snippet: latLng2.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                position: latLng2,
                markerId: MarkerId('CHENNAI')),
            Marker(
                infoWindow: InfoWindow(
                    title: isChecked == false
                        ? 'ENSURE YOUR LOCATION'
                        : getDistance(mylocation!, latLng3).toString() +
                            "KM AWAY",
                    snippet: latLng3.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet),
                position: latLng3,
                markerId: MarkerId('PUDHUCHERRY')),
            Marker(
                infoWindow: InfoWindow(
                    title: isChecked == false
                        ? 'ENSURE YOUR LOCATION'
                        : getDistance(mylocation!, latLng4).toString() +
                            "KM AWAY",
                    snippet: latLng4.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
                position: latLng4,
                markerId: MarkerId('HARYANA')),
            Marker(
                infoWindow: InfoWindow(
                    title: isChecked == false
                        ? 'ENSURE YOUR LOCATION'
                        : getDistance(mylocation!, latLng5).toString() +
                            "KM AWAY",
                    snippet: latLng5.toString()),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueCyan),
                position: latLng5,
                markerId: MarkerId('TRIPURA')),
            if (isChecked == true) tnMarker1
          },
          mapType: MapType.normal,
          onMapCreated: onMapCreated,
          initialCameraPosition:
              CameraPosition(tilt: 74, zoom: 4, target: latLng3)),
    );
  }
}

getDistance(LatLng from, to) {
  double distance = Geolocator.distanceBetween(
      from.latitude, from.longitude, to.latitude, to.longitude);
  String string = "";

  print(distance.toString());
  string = distance.truncate().toString();
  return string.substring(0, string.length - 3);
}
