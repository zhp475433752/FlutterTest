import 'package:flutter/material.dart';

// 限制容器类 对于minWidth和minHeight来说，是取父子中相应数值较大的。
// UnconstrainedBox对父限制的“去除”并非是真正的去除，父容器所占用的空间的min值仍旧生效
class MyConstrainedBoxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyConstrainedBoxWidgetState();
  }
}

class MyConstrainedBoxWidgetState extends State<MyConstrainedBoxWidget> {
  Widget redBox =
  DecoratedBox(decoration: BoxDecoration(color: Colors.deepOrange));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("限制容器类 ConstrainedBox"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(), // 宽度尽可能大
        child: SizedBox(
          width: 300,
          height: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange[700]!]),
                //背景渐变
                borderRadius: BorderRadius.circular(5),
                // 圆角
                boxShadow: [
                  BoxShadow(color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 5)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "transformpage");
                },
                child: Text("BoxDecoration"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
