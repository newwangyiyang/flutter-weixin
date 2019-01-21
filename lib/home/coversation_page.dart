import 'package:flutter/material.dart';
import '../model/coversation.dart';
import '../config.dart';
class _CoversationItem extends StatelessWidget {
  final Conversation coversationItem;
  _CoversationItem({Key key, @required this.coversationItem}):super(key:key);

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
          Image.asset(
            'assets/images/ic_file_transfer.png',
            width: 50,
            height: 50,
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
                    Text('tengxun', style: AppStyle.DesStyle,),
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

class CoversationPage extends StatefulWidget {
  _CoversationPageState createState() => _CoversationPageState();
}

class _CoversationPageState extends State<CoversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        return _CoversationItem(coversationItem: coversationList[index],);
      },
      itemCount: coversationList.length,
    );
  }
}