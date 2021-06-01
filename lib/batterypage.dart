import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 🔋电池电量
class BatteryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BatteryState();
  }
}

class BatteryState extends State<BatteryWidget> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("电池电量"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: _getBatteryLevel, child: Text("点击获取电池电量"),),
            Text(_batteryLevel)
          ],
        ),
      ),
    );
  }
}
