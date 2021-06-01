import 'package:fluttertest/component/CommonGreenRoundButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/component/OccupationItem.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 职业信息学生页面
/// @Author: hpzhang
/// @Date: 2019-04-15 16:50:39
/// @Last Modified by: hpzhang
/// @Last Modified time: 2019-04-15 16:50:46

// ignore: must_be_immutable
class OccupationStudent extends StatefulWidget {
  String? occupationCode = ''; // 职业code
  String? schoolName = ''; // 学校名称
  String? majorName = ''; //所学专业
  String? entranceDate = ''; //入学时间
  String? graduateDate = ''; //毕业时间

  OccupationStudent(this.occupationCode,
      {this.schoolName, this.majorName, this.entranceDate, this.graduateDate});

  @override
  State<StatefulWidget> createState() {
    return OccupationStudentState();
  }
}

class OccupationStudentState extends State<OccupationStudent> {
  String? occupationCode = '';
  String? schoolName = '';
  String? majorName = '';
  String? entranceDate = '';
  String? graduateDate = '';

  @override
  // ignore: must_call_super
  void initState() {
    occupationCode = widget.occupationCode;
    schoolName = widget.schoolName;
    majorName = widget.majorName;
    entranceDate = widget.entranceDate;
    graduateDate = widget.graduateDate;
  }

  // 显示日历
  void _showDatePicker(int type) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (dateTime != null) {
      StringBuffer buffer = StringBuffer();
      if (dateTime.month < 10) {
        buffer.write('0');
      }
      buffer.write(dateTime.month);
      buffer.write('-');
      buffer.write(dateTime.year);
      if (type == 1) {
        setState(() {
          entranceDate = buffer.toString();
        });
      } else if (type == 2) {
        setState(() {
          graduateDate = buffer.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 学校名称
        OccupationItem(
          itemName: '学校名称',
          itemTextValue: schoolName,
          itemTextHint: '请输入学校名称',
          itemEnabled: true,
          itemInputCallback: (value) {
            schoolName = value;
          },
        ),

        // 所学专业
        OccupationItem(
          itemName: '所学专业',
          itemTextValue: majorName,
          itemTextHint: '请输入专业信息',
          itemEnabled: true,
          itemInputCallback: (value) {
            majorName = value;
          },
        ),

        // 入学时间
        InkWell(
          onTap: () {
            _showDatePicker(1);
          },
          child: OccupationItem(
            itemName: '入学时间',
            itemTextValue: entranceDate,
            itemTextHint: '请选择入学时间',
          ),
        ),

        // 毕业时间
        InkWell(
          onTap: () {
            _showDatePicker(2);
          },
          child: OccupationItem(
            itemName: '毕业时间',
            itemTextValue: graduateDate,
            itemTextHint: '请选择毕业时间',
          ),
        ),

        // 确定按钮
        CommonGreenRoundButton(
          onClickEvent: () {
            if (occupationCode == '' ||
                occupationCode == null ||
                schoolName == '' ||
                schoolName == null ||
                majorName == '' ||
                majorName == null ||
                entranceDate == '' ||
                entranceDate == null ||
                graduateDate == '' ||
                graduateDate == null) {
              Fluttertoast.showToast(msg: '信息不全或有误');
            } else {
              Fluttertoast.showToast(
                  msg: occupationCode! +
                      ' - ' +
                      schoolName! +
                      ' - ' +
                      majorName! +
                      ' - ' +
                      entranceDate! +
                      ' - ' +
                      graduateDate!);
            }
          },
        ),
      ],
    );
  }
}
