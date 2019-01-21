import 'package:flutter/material.dart';

class AppColors{
  static const Color appBarColor = Color.fromRGBO(48, 48, 48, 1);
  static const TabIconActiveColor = 0xff46c11b;
  static const TabIconNormalColor = 0xff999999;
  static const PopupMeauButtonColor = 0xffffffff;
  static const CoversationTitleColor = 0xff353535;
  static const CoversationItemColor = 0xffffffff;
  static const DesCoversationColor = 0xff353535;
}

class AppStyle {
  static const TitleStyle = TextStyle(
    fontSize: 20,
    color: Color(AppColors.CoversationTitleColor),
    
  );
  static const DesStyle = TextStyle(
    fontSize: 14,
    color: Color(AppColors.DesCoversationColor),
  );
}

class Constans {
  static const IconFontFamilt = 'appIconFont';
}