import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class MyListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyListViewWidgetState();
  }
}

class MyListViewWidgetState extends State<MyListViewWidget> {
  List widgets = [];
  Widget divider1 = Divider(
    color: Colors.red,
    height: 1,
  );
  Widget divider2 = Divider(
    color: Colors.black54,
    height: 1,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("网络请求ListView"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    bool showLoadingDialog = widgets.isEmpty;
    if (showLoadingDialog) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.separated(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: '您点击了位置 $position');
              },
              child: Container(
                height: 50,
                alignment: Alignment.centerLeft,
                child: Text("Row ${widgets[position]["title"]}"),
              ),
            );
          },
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          });
    }
  }

  Future<void> loadData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(Uri.parse(url));
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
