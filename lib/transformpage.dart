import 'package:flutter/material.dart';

// Transform可以在其子Widget绘制时对其应用一个矩阵变换
// 可以实现 平移 旋转 缩放等效果
class MyTransformPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyTransformPageState();
  }
}

class MyTransformPageState extends State<MyTransformPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Transform变换"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: new Transform(
          transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.4弧度
          child: new Container(
            padding: EdgeInsets.all(20),
            color: Colors.red,
            child: RaisedButton(
              child: Text("Aparment for rent"),
              onPressed: () {
                Navigator.pushNamed(context, "containerpage");
              },
            ),
          ),
          alignment: Alignment.topRight,
        ),
      ),
    );
  }
}
