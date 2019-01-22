import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../config.dart';
class _ContactItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;
  final double _itemHeight = 55;
  _ContactItem({Key key, @required this.avatar, @required this.title, this.groupTitle, this.onPressed}):super(key:key);
  
  final Contact contact = ContactPageData.contactList[0];

  double _height(bool isGroupTitle) {
    double _itemHeight = 8 * 2 + 45 + .5;
    if(isGroupTitle) {
      _itemHeight += 25;
    }
    return _itemHeight;
  }

  @override
  Widget build(BuildContext context) {
    Widget _itemMain = Container(
      margin: EdgeInsets.only(left: 14, right: 14),
      // padding: EdgeInsets.only(top: 8, bottom: 8),
      height: _itemHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Color(AppColors.CoversationTitleColor)))
      ),
      child: Row(
        children: <Widget>[
          avatar.startsWith('http://') || avatar.startsWith('https://') ?
          Image.network(
            avatar,
            width: 45,
            height: 45,
          ) : 
          Image.asset(
            avatar,
            width: 45,
            height: 45,
          ),
          SizedBox(width: 10,),
          Text(title, style: AppStyle.TitleStyle,)
        ],
      ),
    );

    // 控制索引letter的显示
    Widget _itemBody;
    if(this.groupTitle != null){
      _itemBody = Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 25,
            padding: EdgeInsets.only(left: 15),
            color: Color(0xffebebeb),
            child: Text(this.groupTitle, style: AppStyle.DesStyle,),
          ),
          _itemMain,
        ],
      );
    } else {
      _itemBody = _itemMain;
    }
    return _itemBody;
  }
}

const INDEX_BAR_WORDS = [
  "↑", "☆",
  "A", "B", "C", "D", "E", "F", "G",
  "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T", "U",
  "V", "W", "X", "Y", "Z", "#"
];

class ContactPage extends StatefulWidget {
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ScrollController _scrollController;
  final List<Contact> list = ContactPageData.contactList;
  final List<_ContactItem> _functionButton = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png', 
      title: '新的朋友',
      onPressed: (){
        print('新的朋友');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png', 
      title: '群聊',
      onPressed: (){
        print('群聊');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png', 
      title: '标签',
      onPressed: (){
        print('标签');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png', 
      title: '公众号',
      onPressed: (){
        print('公众号');
      },
    ),
  ];
  Color _letterBg = Colors.transparent;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((v){
      return Expanded(
        child: Text(v),
      );
    }).toList();
    return Stack(
      children: <Widget>[
        ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index){
            if(index < 4) {
              return _functionButton[index];
            }
            var item = list[index-4];
            list.sort((a,b)=>a.nameIndex.compareTo(b.nameIndex));
            bool _isGroupTitle = true;
            if(index>=5 && item.nameIndex == list[index-5].nameIndex ) {
              _isGroupTitle = false;
            }
            return _ContactItem(avatar: item.avatar, title: item.name, groupTitle: _isGroupTitle ? item.nameIndex : null,);
          },
          itemCount: list.length + 4,
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            color: _letterBg,
            width: 24,
            child: GestureDetector(
              child: Column(
                children: _letters,
              ),
              onVerticalDragDown: (DragDownDetails detail){
                setState(() {
                  _letterBg = Colors.black26; 
                  _scrollController.animateTo(250, curve: Curves.easeInOut, duration: Duration(milliseconds: 200));                 
                });
              },
              onVerticalDragEnd: (DragEndDetails detail) {
                setState(() {
                  _letterBg = Colors.transparent;                  
                });
              },
              onVerticalDragCancel: () {
                setState(() {
                  _letterBg = Colors.transparent;                  
                });
              },
            ),
          ),
        )
      ],
    );
  }
}