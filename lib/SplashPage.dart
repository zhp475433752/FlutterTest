import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    countDown();
  }
  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      'images/splash.jpg',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }


  /**
   * 倒计时
   */
  void countDown() {
    var _duration = Duration(seconds: 2);
    new Future.delayed(_duration, goHomePage);
  }

  /**
   * 页面跳转
   */
  void goHomePage() {
    // Navigator.of(context).pushReplacementNamed('/index');
    Navigator.pushReplacementNamed(context, "home");
  }


}