import 'package:flutter/material.dart';
import '../model/coversation.dart';
import '../config.dart';

enum Device {
  MAC, WIN
}

class _CoversationItem extends StatelessWidget {
  final Conversation coversationItem;
  _CoversationItem({Key key, @required this.coversationItem}):super(key:key);
  //未读消息文本信息
  Widget unReadMsgCountText() { 
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(AppColors.NotifyDotBg),
      ),
      child: Center(
        child: Text(coversationItem.unreadMsgCount.toString(), style: AppStyle.NotifyMsgCountDotStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      height: 70,
      decoration: BoxDecoration(
        color: Color(AppColors.CoversationItemColor),
        border: Border(bottom: BorderSide(
          width: .5,
          color: Color(AppColors.DesCoversationColor)
        ))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              // 三元判断是否是网络图片
              coversationItem.isNetwork() ? Image.network( 
                coversationItem.avatar,
                width: 45,
                height: 45,
              ) : 
              Image.asset(
                coversationItem.avatar,
                width: 45,
                height: 45,
              ),
              coversationItem.unreadMsgCount > 0 ? Positioned(
                child: unReadMsgCountText(),
                top: -6,
                right: -6,
              ) : Container(height: 0,width: 0,),
            ],
          ),

          Container(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(coversationItem.title, style: AppStyle.TitleStyle),
                    Text(coversationItem.updateAt, style: AppStyle.DesStyle,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(coversationItem.des, style: AppStyle.DesStyle, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    ),
                    coversationItem.isMute ? Icon(
                      IconData(
                        0xe755,
                        fontFamily: Constans.IconFontFamilt
                      ),
                      size: 18,
                      color: Color(AppColors.TabIconNormalColor),
                    ) : Text(''),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
} 

class _DeviceInfo extends StatelessWidget {
  final Device device;
  _DeviceInfo({Key key, this.device=Device.WIN}):super(key:key);

  int getIconData() {
    return device == Device.WIN ? 0xe75e : 0xe640;
  }
  String get deviceName {
    return device == Device.WIN ? 'Window' : 'Mac';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
      height: Constans.DeviceInfoHeight,
      decoration: BoxDecoration(
        color: Color(AppColors.DeviceInfoBg),
        border: Border(bottom: BorderSide(
          width: .3,
          color: Color(AppColors.TabIconNormalColor)
        ))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            IconData(
              getIconData(),
              fontFamily: Constans.IconFontFamilt
            ),
            color: Color(AppColors.TabIconNormalColor),
            size: 24,
          ),
          SizedBox(width: 20,),
          Text(
            '$deviceName 已登录，手机通知已关闭。',
            style: AppStyle.DeviceInfoTextStyle,
          )
        ],
      ),
    );
  }
}

class CoversationPage extends StatefulWidget {
  _CoversationPageState createState() => _CoversationPageState();
}

class _CoversationPageState extends State<CoversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index){
        if(index == 0) {
          return _DeviceInfo(device: Device.WIN,);
        }
        return _CoversationItem(coversationItem: coversationList[index-1],);
      },
      itemCount: coversationList.length + 1,
    );
  }
}