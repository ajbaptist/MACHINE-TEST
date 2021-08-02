import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task/map/map.dart';

LatLng latLng = LatLng(11.059821, 78.387451);
LatLng latLng2 = LatLng(17.123184, 79.208824);
LatLng latLng3 = LatLng(23.473324, 77.947998);
LatLng latLng4 = LatLng(29.065773, 76.040497);
LatLng latLng5 = LatLng(23.745127, 91.746826);
LatLng? mylocation;

Marker tnMarker1 = Marker(
    infoWindow: InfoWindow(
      title: 'YOU ARE HERE',
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: mylocation!,
    markerId: MarkerId('YOUR LOCATION'));
