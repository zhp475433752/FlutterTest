import 'package:flutter/material.dart';

// 层叠布局 类似Android中FrameLayout
class MyStackPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStackPageWidgetState();
  }
}

class MyStackPageWidgetState extends State<MyStackPageWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 Stack"),
      ),
      body: ConstrainedBox(
        //通过ConstrainedBox来确保Stack占满屏幕
        constraints: BoxConstraints.expand(),
        child: Stack(
          // 类似于 FrameLayout
          alignment: Alignment.topLeft,
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "constrained_page");
              },
              child: Text("点击我启动容器类"),
            ),
            Positioned(
              child: Text("who are you"),
              top: 120,
              left: 20,
            )
          ],
        ),
      ),
    );
  }
}
