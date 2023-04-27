import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:latlong2/latlong.dart";
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:geolocator/geolocator.dart';

class GetHost extends StatefulWidget {
  const GetHost({super.key});

  @override
  State<GetHost> createState() => _GetHostState();
}

class _GetHostState extends State<GetHost> {
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  LatLng? userLoc;
  Marker? userPoint;
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    getLatlong();
    super.initState();
  }

  getLatlong() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    userPoint = Marker(
        width: 120,
        height: 120,
        point: LatLng(position.latitude, position.longitude),
        builder: (ctx) => GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                  content: Text('Tapped on blue FlutterLogo Marker'),
                ));
              },
              child: Column(children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                Text("HOST 1")
              ]),
            ));

    setState(() {
      userLoc = LatLng(position.latitude, position.longitude);
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      setState(() {
        userLoc = LatLng(position.latitude, position.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return userLoc == null
        ? const Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(
              center: userLoc,
              zoom: 12,
            ),
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: null,
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [userPoint!],
              )
            ],
          );
    ;
  }
}
