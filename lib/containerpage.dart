import 'package:flutter/material.dart';

class MyContainerPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyContainerPageState();
  }
}

class MyContainerPageState extends State<MyContainerPageWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Container容器"),
      ),
      body: Container(
        child: Text("这是容器类"),
        margin: EdgeInsets.only(top: 50, bottom: 50, left: 100),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.red, Colors.yellow],
                center: Alignment.center,
                radius: .98),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(2.0, 2), blurRadius: 4)
            ]),
        transform: Matrix4.rotationZ(.3),
        //卡片倾斜变换
        alignment: Alignment.center, //卡片内文字居中
      ),
    );
  }
}
