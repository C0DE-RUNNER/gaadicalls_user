import 'package:flutter/material.dart';
import 'package:flutterapp/api_notify.dart';
import 'package:shared_preferences/shared_preferences.dart';



class GetTimestamp extends StatefulWidget {
  @override
  _GetTimestampState createState() => _GetTimestampState();
}

class _GetTimestampState extends State<GetTimestamp> {
  _GetTimestampState(){
    _loadtimestamp();
  }
  _loadtimestamp() async {
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    prefs.setInt('id', DateTime.now().millisecondsSinceEpoch);
    print(prefs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor App',
        style: TextStyle(
          fontSize: 20
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed:(){
                api_notify();
              },
              child: Text('Start',
              style:TextStyle(
                fontSize: 15
              ),),),
              RaisedButton(
              onPressed:(){},
              child: Text('Stop',
              style:TextStyle(
                fontSize: 15
              ),),)
          ],
        ),
      ),

    );
  }
}



