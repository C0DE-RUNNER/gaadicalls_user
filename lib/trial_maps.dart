import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class MyMaps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyMaps> {
  GoogleMapController mapController;

  _MyAppState (){

  }
   LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String url = 'https://gaadicalls.firebaseapp.com/add_user/'+DateTime.now().millisecondsSinceEpoch.toString();
  Future<String> makeRequest() async {
    var response = http.get(Uri.encodeFull(url));
  }

  String _locationMessage = "";

  dynamic _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    _center = LatLng(position.latitude, position.longitude);
    setState(() {

    });

    url+="/"+position.latitude.toString()
        +"/"+position.longitude.toString();
    //  _locationMessage = "${position.latitude}, ${position.longitude}";
    makeRequest();
  return _center;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: FutureBuilder(
            future:  _getCurrentLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: (snapshot.data),
                    zoom: 11.0,
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            })
      ),
    );
  }
}