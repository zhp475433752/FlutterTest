import 'package:fluttertest/component/CommonGreenRoundButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 职业信息默认页面
/// @Author: hpzhang
/// @Date: 2019-04-15 16:50:39
/// @Last Modified by: hpzhang
/// @Last Modified time: 2019-04-15 16:50:46

class OccupationDefault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonGreenRoundButton(
      onClickEvent: () {
        Fluttertoast.showToast(msg: '信息不全或有误');
      },
    );
  }
}
