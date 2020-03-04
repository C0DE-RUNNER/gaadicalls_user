import 'package:flutter/material.dart';
import './List.dart';
import 'package:flutterapp/Vendor.dart';
import 'package:flutterapp/vendor_details.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
       style: TextStyle(
         fontSize: 20
       ), ),
      ),
      body: Center(
        child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed:(){
               Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Lists()), );
            },
            child: Text('Customer',
            style: TextStyle(
              fontSize: 20.0
            ),), ),
            Container(
              width: 50,
            ),
            RaisedButton(
            onPressed:(){
               Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>GetTimestamp() ));
            },
            child: Text('Vendor',
            style: TextStyle(
              fontSize: 20.0
            ),), )

        ],
      ),
      ),
    );
  }
}