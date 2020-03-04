import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/Screen1.dart';
import 'package:flutterapp/settings.dart';
import 'package:flutterapp/vendor_details.dart';

import 'db_helper.dart';

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {

    var dbhelper;

    _ListsState(){
      dbhelper = DBhelper();
    }



    data(List<Vendor> vendors)  {
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
          fontSize: 20
        ),),
        backgroundColor: Colors.greenAccent,      
      ),
      body:list() ,
              floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Screen1()));
          },
          label: Text(
            'Register',
            style: TextStyle(fontSize: 15),
          ),
        ));
  
  }
}