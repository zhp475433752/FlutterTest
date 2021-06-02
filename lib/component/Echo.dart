import 'package:flutter/material.dart';

class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo(
      {Key? key, required this.text, this.backgroundColor: Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        height: 50,
        width: 200,
        child: Text(text),
      ),
    );
  }
}
