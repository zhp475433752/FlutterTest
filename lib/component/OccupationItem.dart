import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/constants/Constants.dart';

/*
 * 职业信息页面item
 * @Author: hpzhang
 * @Date: 2019-04-16 13:37:43
 * @Last Modified by: hpzhang
 * @Last Modified time: 2019-04-16 13:37:56
 */
// ignore: must_be_immutable
class OccupationItem extends StatelessWidget {
  /// 文本的默认值
  String? itemTextValue = '';

  /// 该 item 类型名称，如职业、公司名称、地址、毕业日期等
  String itemName;

  /// 文本的默认提示信息
  String? itemTextHint;

  /// 是否可以编辑 true:可以输入，不显示选择箭头；false:只能选择，不能输入，需要显示选择箭头
  bool itemEnabled;

  /// 输入文本回调函数
  Function(String inputValue)? itemInputCallback;

  /// 输入类型
  /// UkuOccupationInputType.TYPE_TEXT:默认是文本
  /// UkuOccupationInputType.TYPE_TEL:电话
  /// UkuOccupationInputType.TYPE_MONEY:钱数（有Rp标识）
  int itemInputType;

  OccupationItem({
    Key? key,
    required this.itemName,
    this.itemTextValue,
    this.itemTextHint,
    this.itemEnabled = false,
    this.itemInputType = TYPE_TEXT,
    this.itemInputCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemInputType != TYPE_TEXT &&
        itemInputType != TYPE_TEL &&
        itemInputType != TYPE_MONEY) {
      itemInputType = TYPE_TEXT;
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              itemName,
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  (itemInputType == TYPE_MONEY)
                      ? Text(
                          'Rp ',
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF333333)),
                        )
                      : Text(''),
                  Expanded(
                    child: TextField(
                      keyboardType: (itemInputType == TYPE_TEXT)
                          ? TextInputType.text
                          : TextInputType.number,
                      //允许的输入格式 下方的模式指只允许输入数字
                      inputFormatters: (itemInputType != TYPE_TEXT)
                          ? [WhitelistingTextInputFormatter.digitsOnly]
                          : [],
                      style: TextStyle(color: Color(0xFF333333), fontSize: 17),
                      onChanged: itemInputCallback,
                      controller:
                          TextEditingController(text: this.itemTextValue),
                      enabled: itemEnabled,
                      decoration: InputDecoration(
                        hintText: itemTextHint,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  itemEnabled ? Text('') : Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Color(0xFFE2E2E2),
            )
          ],
        ),
      ),
    );
  }
}
