import 'package:flutter/material.dart';

// 弹性布局 flex参数和Android中权重一样
class MyFlexPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFlexPageWidgetState();
  }
}

class MyFlexPageWidgetState extends State<MyFlexPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("弹性布局Flex"),
        ),
        body: Column(
          children: <Widget>[
            //Flex的两个子widget按1：2来占据水平空间
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Spacer(
                      flex: 2, // 占用指定比例空间 没有背景颜色
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "wrap_page");
                      },
                      child: Text("启动流式布局"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
