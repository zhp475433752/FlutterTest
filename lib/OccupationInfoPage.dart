import 'package:flutter/material.dart';

class OccupationInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OccupationInfoPageState();
  }
}

class _OccupationInfoPageState extends State<OccupationInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("职业信息"),
      ),

      body: new Center(
        child: new Column(
          children: <Widget>[
            Text('这是职业信息也妈咪分为奇偶')
          ],
        ),
      ),
    );
  }
}
