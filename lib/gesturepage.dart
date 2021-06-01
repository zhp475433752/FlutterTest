import 'package:flutter/material.dart';

/// 手势页面
class GestureDetectorTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GestureState();
  }
}

class _GestureState extends State<GestureDetectorTestRoute> {
  String _operation = "这是手势名称";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势页面"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.orangeAccent,
            width: 300,
            height: 300,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          onTap: () => updateText("点击"),
          onDoubleTap: () => updateText("双击666"),
          onLongPress: () => updateText("长按"),
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
