import 'package:flutter/material.dart';

/// 新页面 主要是各种button
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('这是一个新页面' * 8),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(
            '这是新的页面区域费我就及范围及就佛文件覅我积分我没见佛我王嘉尔金佛就佛文件覅我积分我没见佛我王嘉尔我文件否',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.black,
                fontSize: 20,
                background: new Paint()..color = Colors.yellow,
                fontWeight: FontWeight.bold),
          ),
          RaisedButton(onPressed: () => {}, child: Text('RaisedButton')),
          FlatButton(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            onPressed: () {
              Navigator.pushNamed(context, "check_page"); // 跳转到复选框页面
            },
            child: Text(
              '启动复选框页面',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            color: Colors.deepOrange,
            // 按钮背景色
            highlightColor: Colors.green,
            // 按钮点击后高亮色
            splashColor: Colors.yellow,
            // 按钮按下水波颜色
            colorBrightness: Brightness.dark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)), // 圆角
          ),
          OutlineButton(onPressed: () => {}, child: Text('OutlineButton')),
          IconButton(onPressed: () => {}, icon: Icon(Icons.favorite)),
          Image.asset(
            "images/ic_hbw_overdue.png",
            width: 200,
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 200,
          ),
//          Image.asset("images/bg_home_blue_top.jpg", width: 300,),
//          Image.asset("images/bg_home_blue_top.jpg", width: 300,),
        ],
      )),
    );
  }
}
