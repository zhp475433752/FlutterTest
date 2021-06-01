import 'package:flutter/material.dart';

// 流式布局 自动换行
class MyWrapWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWrapWidgetState();
  }
}

class MyWrapWidgetState extends State<MyWrapWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("流式布局 Wrap"),
      ),
      body: Wrap(
        spacing: 10,
        runSpacing: 5,
        alignment: WrapAlignment.center,
        children: <Widget>[
          new Chip(
            label: new Text("测试1"),
            avatar: new CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
          ),
          new Chip(
            label: Text("测试2"),
            avatar: new CircleAvatar(
              backgroundColor: Colors.red,
              child: Text("B"),
            ),
          ),
          new Chip(
            label: Text("测试3"),
            avatar: new CircleAvatar(
              backgroundColor: Colors.lime,
              child: Text("C"),
            ),
          ),
          new Chip(
            label: Text("测试4"),
            avatar: new CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("D"),
            ),
          ),
          new Chip(
            label: Text("测试5"),
            avatar: new CircleAvatar(
              backgroundColor: Colors.red,
              child: Text("E"),
            ),
          ),
          RaisedButton(onPressed: () {
            Navigator.pushNamed(context, "stack_page");
          }, child: Text("启动层叠布局"),)
        ],
      ),
    );
  }
}
