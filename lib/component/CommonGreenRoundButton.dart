import 'package:flutter/material.dart';

/*
 * 公共绿色背景圆角按钮 可以传递按钮文字
 * @Author: hpzhang
 * @Date: 2019-04-15 15:48:28
 * @Last Modified by: hpzhang
 * @Last Modified time: 2019-04-15 15:48:33
 */
// ignore: must_be_immutable
class CommonGreenRoundButton extends StatelessWidget {
  // 按钮文本
  String text;

  // 点击回调方法
  Function onClickEvent;

  CommonGreenRoundButton(
      {Key? key, this.text = '确定', required this.onClickEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Container(
            height: 50,
            child: FlatButton(
              onPressed: () => this.onClickEvent(),
              // 跳转到复选框页面,
              child: Text(
                text,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              color: Color(0xff019a84),
              // 按钮背景色
              colorBrightness: Brightness.dark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)), // 圆角
            ),
          ),
        ))
      ],
    );
  }
}
