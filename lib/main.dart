import 'package:flutter/material.dart';
import 'config.dart';
import 'home/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weixinDemo',
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.appBarColor,
        cardColor: AppColors.appBarColor, //设置PopupMenuButton的背景颜色, 右上角点击 + 号
      ),
      home: HomeScreen(),
    );
  }
}