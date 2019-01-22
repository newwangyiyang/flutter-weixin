import 'package:flutter/material.dart';

class AppColors{
  static const Color appBarColor = Color.fromRGBO(48, 48, 48, 1);
  static const TabIconActiveColor = 0xff46c11b;
  static const TabIconNormalColor = 0xff999999;
  static const PopupMeauButtonColor = 0xffffffff;
  static const CoversationTitleColor = 0xff353535;
  static const CoversationItemColor = 0xffffffff;
  static const DesCoversationColor = 0xff353535;
  static const NotifyDotBg = 0xffff3e3e;
  static const NotifyText = 0xffffffff;
  static const DeviceInfoBg = 0xfff5f5f5;
  static const DeviceInfoText = 0xff606062;
}

class AppStyle {
  static const TitleStyle = TextStyle(
    fontSize: 18,
    color: Color(AppColors.CoversationTitleColor),
    
  );
  static const DesStyle = TextStyle(
    fontSize: 14,
    color: Color(AppColors.DesCoversationColor),
  );
  static const NotifyMsgCountDotStyle = TextStyle(
    fontSize: 12,
    color: Color(AppColors.NotifyText),
  );
  static const DeviceInfoTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DeviceInfoText)
  );
}

class Constans {
  static const IconFontFamilt = 'appIconFont';
  static const DeviceInfoHeight = 32.0;
}