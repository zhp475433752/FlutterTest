import 'package:flutter/material.dart';

class MySingleChildScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return new Scaffold(
      appBar: new AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: new Scrollbar(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: string
                .split("")
                .map((c) => Text(
                      c,
                      textScaleFactor: 3.0,
                    ))
                .toList(),
          ),
        ),
      )),
    );
  }
}
