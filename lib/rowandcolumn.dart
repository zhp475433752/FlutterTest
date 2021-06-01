import 'package:flutter/material.dart';

// 线性布局
class RowAndColumnWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RowAndColumnState();
  }
}

class RowAndColumnState extends State<RowAndColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("线性布局 Row Column"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.max, //有效，外层Column高度为整个屏幕
            children: <Widget>[
              Expanded(
                  // 使用 Expanded widget 可以让内部控件高度沾满父控件
                  child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Column高度为实际高度
                  children: <Widget>[
                    Text("hello"),
                    Text("测试页面测试页面测"),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "flex_page");
                      },
                      child: Text("点击跳转弹性布局页面"),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
