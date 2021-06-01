import 'package:flutter/material.dart';

class MyGridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("我是GridView"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.airline_seat_flat),
          Icon(Icons.cake),
          Icon(Icons.fast_forward),
          Icon(Icons.account_balance),
          Icon(Icons.account_box),
          Icon(Icons.adb),
        ],
      ),
    );
  }
}
