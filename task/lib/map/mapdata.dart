import 'package:google_maps_flutter/google_maps_flutter.dart';

LatLng latLng = LatLng(11.059821, 78.387451);
LatLng latLng2 = LatLng(17.123184, 79.208824);
LatLng latLng3 = LatLng(23.473324, 77.947998);
LatLng latLng4 = LatLng(29.065773, 76.040497);
LatLng latLng5 = LatLng(23.745127, 91.746826);

Marker tnMarker = Marker(
    infoWindow: InfoWindow(title: 'TAMIL NADU', snippet: latLng.toString()),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: latLng,
    markerId: MarkerId('TAMIL NADU'));
Marker tlMarker = Marker(
    infoWindow: InfoWindow(title: 'TELANGANA', snippet: latLng2.toString()),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    position: latLng2,
    markerId: MarkerId('TELANGANA'));
Marker mpMarker = Marker(
    infoWindow:
        InfoWindow(title: 'MADHYA PRADESH', snippet: latLng3.toString()),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    position: latLng3,
    markerId: MarkerId('MADHYA PRADESH'));
Marker hrMarker = Marker(
    infoWindow: InfoWindow(title: 'HARYANA', snippet: latLng4.toString()),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    position: latLng4,
    markerId: MarkerId('HARYANA'));
Marker tpMarker = Marker(
    infoWindow: InfoWindow(title: 'TRIPURA', snippet: latLng5.toString()),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: latLng5,
    markerId: MarkerId('TRIPURA'));
