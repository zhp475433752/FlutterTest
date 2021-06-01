import 'package:flutter/material.dart';

// 复选框和输入框
class MyCheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyCheckBoxState();
  }
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  TextEditingController _controller = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  void initState() {
    _controller.addListener(() {
      print("用户名=" + _controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("复选框页面"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            Switch(
                value: _switchSelected, // 当前状态
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value; // 设置最新状态
                  });
                }),
            Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.deepOrange,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                }),
            Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                child: TextField(
                  autofocus: true,
                  maxLength: 11,
                  maxLengthEnforced: false,
                  // 超过最大长度后是否拦截
                  focusNode: focusNode1,
//              onChanged: (value){
//                if(value.length == 11) {
//                  _userName = value;
//                }
//              },
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "请输入11位手机号",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person)),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.green, width: 1.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                autofocus: false,
                obscureText: true,
                maxLength: 6,
                maxLengthEnforced: true,
                focusNode: focusNode2,
                onChanged: (value) {
                  // TODO onChange方法 限制长度后会多次调用 但是设置 controller 就不会多次调用
                  if (value.length == 6) {
                    print("您输入的6位密码为:" + value);
                  }
                },
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入6位密码",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (focusScopeNode == null) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode!.requestFocus(focusNode2);
              },
              child: Text("移动焦点"),
            ),
            RaisedButton(
              onPressed: () {
                // 当所有编辑框都失去焦点时键盘就会收起
                focusNode1.unfocus();
                focusNode2.unfocus();
                Navigator.pushNamed(
                    context, "row_column_page"); // 启动 Row和Column页面
              },
              child: Text("关闭键盘"),
            ),
          ],
        ),
      ),
    );
  }
}
