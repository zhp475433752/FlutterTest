import 'package:fluttertest/bean/PDRDEOccupationItem.dart';
import 'package:flutter/material.dart';

/*
 * 职业信息填写用到的列表对话框
 * @Author: hpzhang
 * @Date: 2019-04-10 13:40:58
 * @Last Modified by: hpzhang
 * @Last Modified time: 2019-04-10 13:41:09
 */
// ignore: must_be_immutable
class CommonListDialog extends Dialog {
  String title;
  List<PDRDEOccupationItem> data;
  Function(PDRDEOccupationItem item) onItemPressEvent;

  CommonListDialog({
    Key? key,
    this.title = '',
    required this.data,
    required this.onItemPressEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 动态计算高度
    double listViewHeight = 0.0;
    if (data != null && data.length != 0) {
      listViewHeight = data.length * 55.0;
      if (listViewHeight > 330) {
        listViewHeight = 330;
      }
    }

    return new Padding(
      padding: const EdgeInsets.all(0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end, // 对话框在屏幕底部
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
              ),
              margin: const EdgeInsets.all(0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            title,
                            style: new TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        new GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Icon(
                              Icons.close,
                              color: Color(0xffe0e0e0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              constraints:
              BoxConstraints(minHeight: 0.0, maxHeight: listViewHeight),
              child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  itemExtent: 55, // 强制每个item的高度为50
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 54,
                            child: Row(
                              children: <Widget>[
                                Text(data[index].name),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFE2E2E2),
                          )
                        ],
                      ),
                      onTap: () => onItemPressEvent(data[index]),
                    );
                  },
                  itemCount: data.length),
            ),
          ],
        ),
      ),
    );
  }
}
