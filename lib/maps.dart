import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String url = 'https://gaadicalls.firebaseapp.com/add_user/'+DateTime.now().millisecondsSinceEpoch.toString();
  Future<String> makeRequest() async {
    var response = http.get(Uri.encodeFull(url));
  }

  String _locationMessage = "";

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

      url+="/"+position.latitude.toString()
          +"/"+position.longitude.toString();
    //  _locationMessage = "${position.latitude}, ${position.longitude}";
    makeRequest();

  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: Text("Location Services")
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                  ),
                  Text(_locationMessage),
                  FlatButton(
                      onPressed: () {
                        _getCurrentLocation();
                      },
                      color: Colors.green,
                      child: Text("Find Location")
                  )
                ])
        ),
    );
  }
}

/*Align(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_locationMessage),
                    FlatButton(
                        onPressed: () {
                          _getCurrentLocation();
                          },
                        color: Colors.green,
                        child: Text("Find Location")
                    )
                  ]),
            ),*/