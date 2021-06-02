
import 'package:flutter/material.dart';

// State的生命周期
class CounterWidget extends StatefulWidget {

  final int initValue;

  const CounterWidget({Key? key, this.initValue:0});

  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }

}

class _CounterWidgetState extends State<CounterWidget>{
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("生命周期 --- initState");
  }

  // 在调用initState()之后。
  // 在调用didUpdateWidget()之后。
  // 在调用setState()之后。
  // 在调用didChangeDependencies()之后。
  // 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
  @override
  Widget build(BuildContext context) {
    print("生命周期 --- build");
    return Scaffold(
      appBar: AppBar(title: Text('计数器'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: Text('$_counter', style: TextStyle(fontSize: 50, color: Colors.red,), ),
            ),
            ElevatedButton(
              onPressed: () {
                // 查找父级最近的 Scaffold 对应的 ScaffoldState 对象
                ScaffoldState? _state = context.findAncestorStateOfType<ScaffoldState>();
                //调用 ScaffoldState 的 showSnackBar 来弹出 SnackBar
                //如果StatefulWidget的状态是希望暴露出的，应当在StatefulWidget中提供一个of静态方法来获取其State对象
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('我是SnackBar')));
              },
              child: Text('显示SnackBar', style: TextStyle(fontSize: 50, color: Colors.red,), ),
            ),
          ],
        )
      ),
    );
  }

  // 如果Widget.canUpdate返回true则会调用此回调
  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("生命周期 --- didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用此回调。
  @override
  void deactivate() {
    super.deactivate();
    print("生命周期 --- deactivate");
  }

  // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print("生命周期 --- dispose");
  }

  // 专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print("生命周期 --- reassemble");
  }

  //当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("生命周期 --- didChangeDependencies");
  }

}