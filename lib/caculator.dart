import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fluttertest/OccupationInfoPage.dart';
import 'package:fluttertest/batterypage.dart';
import 'package:fluttertest/gesturepage.dart';
import 'package:fluttertest/gridview.dart';
import 'package:fluttertest/unlimitlistviewpage.dart';
import 'newroute.dart';
import 'checkboxpage.dart';
import 'package:fluttertest/rowandcolumn.dart';
import 'package:fluttertest/flexpage.dart';
import 'package:fluttertest/wrappage.dart';
import 'package:fluttertest/stackpage.dart';
import 'package:fluttertest/constrainedbox.dart';
import 'transformpage.dart';
import 'containerpage.dart';
import 'scrollpage.dart';
import 'package:fluttertest/singlechildscrollviewpage.dart';
import 'package:fluttertest/listviewpage.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertest/OccupationStudent.dart';

/// 在运行按钮旁边点击下拉箭头 选择caculator.dart文件运行
void main() {
  // 2秒后再启动APP的home页
  Future.delayed(new Duration(seconds: 2), () {}).then((it) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '计数器', // 应用名称
        theme: new ThemeData(
            primarySwatch: Colors.yellow,
            // 主题色 如果要把顶部导航栏和状态栏的颜色修改成黑色或者白色，需要用到这个属性：primaryColor:Colors.white
            primaryColor: Colors.red),
        routes: {
          // 注册路由表
          "new_page": (context) => NewRoute(),
          "check_page": (context) => MyCheckBox(),
          "row_column_page": (context) => RowAndColumnWidget(),
          "flex_page": (context) => MyFlexPageWidget(),
          "wrap_page": (context) => MyWrapWidget(),
          "stack_page": (context) => MyStackPageWidget(),
          "constrained_page": (context) => MyConstrainedBoxWidget(),
          "transformpage": (context) => MyTransformPage(),
          "containerpage": (context) => MyContainerPageWidget(),
          "scrollpage": (context) => MyScrollPageWidget(),
          "singlechildscrollviewpage": (context) =>
              MySingleChildScrollViewWidget(),
          "listviewpage": (context) => MyListViewWidget(),
          "unlimitlistviewpage": (context) => MyUnLimitListViewWidget(),
          "gridviewpage": (context) => MyGridViewWidget(),
          "gesturepage": (context) => GestureDetectorTestRoute(),
          "batterypage": (context) => BatteryWidget(),
          "occupatioin": (context) => OccupationInfoPage(),
        },
        home: new MyHomePage(title: 'MyHomePage'));
  }
}

/// HomeWidget组件
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key); // {}内部参数为可选参数

  @override
  State<StatefulWidget> createState() => new _MyHomePageState();
}

/// 与HomeWidget相应的State
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  // 读取本地存储的计数
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } on FileSystemException {
      return 0;
    }
  }

  // 获取app内部文件 若卸载APP则改目录不存在,getExternalStorageDirectory 获取SD外部存储目录
  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/flutter_counter.txt');
  }

  Future<Null> _incrementCounter() async {
    // 先自增 _counter ,然后调用 setState 方法通知flutter框架，有状态发生了变化，flutter框架收到通知后，会执行 build 方法来根据新的状态重新构建页面
    setState(() {
      _counter++;
    });
    // 保存计数到本地
    await ((await _getLocalFile()).writeAsString('$_counter'));
  }

  @override
  Widget build(BuildContext context) {
    print("build方法被执行了");
    debugPrint("");
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      // 该 widget 表示与该 State 实例相关联的 widget 实例
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text('You hava pushed the button many times:'),
            new Text(
              '$_counter',
              style: TextStyle(
                  color: Colors.red, fontSize: 50, fontStyle: FontStyle.normal),
            ),
            new RandomWordsWidget(),
            new RaisedButton(
              onPressed: () {
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  // WidgetBuilder类型的回调函数,作用是构建路由页面的具体内容，返回值是一个widget
//                  return new NewRoute();
//                }));
                Navigator.pushNamed(context, "new_page"); // 启用路由命名
              },
              child: Text(
                '点击这里启动第二个页面',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
              ),
              textColor: Color(0xFF000000),
              color: Colors.orange,
              padding: EdgeInsets.all(10),
              splashColor: Colors.green,
              // 水波纹的颜色
              elevation: 10, // 按钮的阴影
            ),
            new ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "scrollpage");
              },
              child: Text("启动可滚动容器页面"),
            ),
            new ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "gesturepage");
              },
              child: Text("手势识别"),
            ),
            new ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "batterypage");
              },
              child: Text("原生电池🔋电量"),
            ),
            new ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "occupatioin");
              },
              child: Text("自定义职业信息页面"),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter, // 点击事件
        tooltip: '增加', // tooltip 长按tip
        child: new Icon(Icons.add),
      ),
    );
  }
}

/// 随机字符串
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(wordPair.toString()),
    );
  }
}
