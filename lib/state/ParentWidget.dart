import 'package:flutter/material.dart';

// 父组件管理状态
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }

}

class _ParentWidgetState extends State<ParentWidget>{

  bool _active = false;

  void _handleTapBoxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }

}

//-------------------------------子组件TapBoxB--------------------------------

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxB({Key? key, this.active: false, required this.onChanged}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }

  void _handleTap() {
    onChanged(!active);
  }

}