import 'package:flutter/material.dart';
import 'package:flutterapp/trial_maps.dart';
import './grouped_buttons.dart';
import './maps.dart';
class Settings extends StatefulWidget {
  @override
  State createState() => SettingPage();
}

class SettingPage extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Settings')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

         // Image(
           // image: new AssetImage("assets/bin.png"),
            //fit: BoxFit.cover,
            //colorBlendMode: BlendMode.darken,
            //color: Colors.black87,
          //),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your Name',
                  ),
                  keyboardType: TextInputType.text,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                ),
                Text("Ring On",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    )),
                CheckboxGroup(
                  labels: <String>[
                    "Sunday",
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "All Days",
                  ],

                  onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                ),
               ButtonBar(
                 children: <Widget>[
                   RaisedButton(
                     onPressed: () {},
                     child: Text('SAVE'),
                     color: Colors.blue,
                   ),
                   RaisedButton(
                     onPressed: () {},
                     child: Text('EXIT'),
                     color: Colors.blue,
                   ),
                   RaisedButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => MyMaps()),
                       );
                     },
                     child: Text('LOCATION'),
                     color: Colors.blue,
                   ),
                 ],
               ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}
