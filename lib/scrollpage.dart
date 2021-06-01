import 'package:flutter/material.dart';

/// 可滚动布局
class MyScrollPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: () {
                  Navigator.pushNamed(context, "singlechildscrollviewpage");
                },
                child: Text(
                  "可滚动布局SingleChildScrollView,和Android中ScrollView一样",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, "listviewpage");
                },
                child: Text(
                  "可滚动布局 ListView",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, "unlimitlistviewpage");
                },
                child: Text(
                  "可滚动布局 无限滚动列表",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: RaisedButton(
                color: Colors.yellow,
                onPressed: () {
                  Navigator.pushNamed(context, "gridviewpage");
                },
                child: Text(
                  "可滚动布局 GridView",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
