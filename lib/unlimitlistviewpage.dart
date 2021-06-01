import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// 无限加载listview
class MyUnLimitListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyUnLimitListViewState();
  }
}

class MyUnLimitListViewState extends State<MyUnLimitListViewWidget> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  // ignore: must_call_super
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无限滚动列表"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            // 到达了末尾
            if (_words[index] == loadingTag) {
              // 不足100条
              if (_words.length - 1 < 100) {
                // 获取数据
                _getData();
                // 加载时显示loading
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      backgroundColor: Colors.red,
                    ),
                  ),
                );
              } else {
                // 已将加载了100条数据，不在获取数据
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "没有更多数据了...",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            }

            return ListTile(
              title: Text(_words[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 3.0,
            );
          },
          itemCount: _words.length),
    );
    ;
  }

  // 模拟获取数据
  void _getData() {
    Future.delayed(Duration(milliseconds: 1000)).then((e) {
      _words.insertAll(
          0,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
