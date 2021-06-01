import 'package:flutter/material.dart';
import 'package:fluttertest/component/CommonListDialog.dart';
import 'package:fluttertest/bean/PDRDEOccupationItem.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertest/component/OccupationItem.dart';
import 'package:fluttertest/OccupationStudent.dart';
import 'package:fluttertest/OccupationDefault.dart';

class OccupationInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OccupationInfoPageState();
  }
}

class _OccupationInfoPageState extends State<OccupationInfoPage> {
  PDRDEOccupationItem _item = new PDRDEOccupationItem(name: '', code: 'DEFAULT');
  List<PDRDEOccupationItem> list = List.generate(1, (index) => PDRDEOccupationItem(name: '学生', code: 'STUDENT'));
  Map<String, Widget> pageMap = new Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PDRDEOccupationItem item1 =
    // PDRDEOccupationItem(name: '学生', code: 'STUDENT');
    PDRDEOccupationItem item2 =
    PDRDEOccupationItem(name: '上班族', code: 'WORKING');
    PDRDEOccupationItem item3 =
    PDRDEOccupationItem(name: '无业', code: 'UNEMPLOYMENT');
    PDRDEOccupationItem item4 =
    PDRDEOccupationItem(name: '企业主', code: 'ENTERPRISE');
    // list.add(item1);
    // list.add(item2);
    // list.add(item3);
    // list.add(item4);
    pageMap.putIfAbsent('DEFAULT', () => new OccupationDefault());
    pageMap.putIfAbsent(
        'STUDENT',
            () =>
        new OccupationStudent(
          "STUDENT",
          schoolName: '清华大学',
          majorName: '计算机',
          entranceDate: '09-2009',
          graduateDate: '07-2013',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("职业信息"),
        ),
        body: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return CommonListDialog(
                            data: list,
                            onItemPressEvent: (item) {
                              Fluttertoast.showToast(msg: "您点击了 " + item.name);
                              Navigator.pop(context);
                              setState(() {
                                _item = item;
                              });
                            });
                      });
                },
                child: OccupationItem(
                  itemName: '职业信息',
                  itemTextValue: _item.name,
                  itemTextHint: '请选择',
                ),
              ),
              pageMap[_item.code]!,
            ],
          ),
        ));
  }
}
