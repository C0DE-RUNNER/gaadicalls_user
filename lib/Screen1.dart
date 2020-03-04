import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/settings.dart';
import 'package:flutterapp/vendor_details.dart';
import 'package:http/http.dart' as http;


import 'db_helper.dart';


class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Future <List<Vendor>> vendors;
  TextEditingController controller = TextEditingController();
  String name;
  int id;
  final formKey = new GlobalKey<FormState>();
  var dbhelper;
  bool isUpdating;

  _Screen1State() {
    dbhelper = DBhelper();
    
    isUpdating = false;
  }


  clearName() {
    controller.text = "";
  }



  add() {

        Vendor v = Vendor(controller.text, null);
        controller.text = "";
        dbhelper.save(v);
        setState(() {
        });
      
    
  }

  form() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: controller,
              style: TextStyle(fontSize: 20),
              validator: (val) =>
                  val.length == 0 ? 'Enter name of vendor' : null,
              onSaved: (val) => name = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  onPressed: add,
                  child: Text('ADD'),
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }

  data(List<Vendor> vendors) {
    return Column(
      children: vendors.map<Widget>((vendor)=>
      ListTile(
                title: Row(
                  children: <Widget>[
                    // Text(vendor.id.toString()),
                   Text(vendor.vname)
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.settings), onPressed: () {
                        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()), );
                    }),
                    IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
                  ],
                ),
              )
        
        ).toList(),
        
    );
  }

  list() {
    return FutureBuilder(
        future: dbhelper.getVendor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return data(snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Vendors List',
                style: TextStyle(
                  fontSize: 20,
                ))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            form(),
            list()
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {

            FirebaseMessaging _fm = FirebaseMessaging();
            _fm.configure(
                onMessage: (Map<String,dynamic> message){
                  print("onmessage");
                }
            );
            _fm.subscribeToTopic("Random");

            String url = 'https://gaadicalls.firebaseapp.com/update_location/'+DateTime.now().millisecondsSinceEpoch.toString()
                +"/22/33";
            http.get(Uri.encodeFull(url));
            /*
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Registration()));*/
          },
          label: Text(
            'Register',
            style: TextStyle(fontSize: 15),
          ),
        ));
  }
}
