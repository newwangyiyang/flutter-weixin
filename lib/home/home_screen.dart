import 'package:flutter/material.dart';
import 'package:weixin/config.dart';

import 'coversation_page.dart';

class NavigationIconView{
  NavigationIconView({Key key, String title, IconData icon, Color color, IconData activeIcon}) : 
    _title = title,
    _icon = icon,
    _color = color,
    _activeIcon = activeIcon,
    item = BottomNavigationBarItem(
      icon: Icon(icon, ), 
      activeIcon: Icon(activeIcon), 
      title: Text(title, ),
      backgroundColor: color
  );
  final String _title;
  final IconData _icon;
  final Color _color;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;
}

enum ActionPopupItems {
  GRONP_CHART, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;
  PageController _pageController;
  List<Widget> _pageList;


  int _currentIndex = 0;
  @override
  void initState() { 
    super.initState();
    this._navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constans.IconFontFamilt
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constans.IconFontFamilt
        ),
        color: Colors.white,
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constans.IconFontFamilt
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constans.IconFontFamilt
        ),
        color: Colors.white,
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe600,
          fontFamily: Constans.IconFontFamilt
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constans.IconFontFamilt
        ),
        color: Colors.white,
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constans.IconFontFamilt
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constans.IconFontFamilt
        ),
        color: Colors.white,
      ),
    ];

    this._pageController = PageController(initialPage: _currentIndex);
    this._pageList = [
      CoversationPage(),
      Container(
        
        color: Colors.greenAccent,
      ),
      Container(color: Colors.black,),
      Container(color: Colors.amber,),
    ];
  }

  Widget _buildPopupMeauItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(iconName, fontFamily: Constans.IconFontFamilt), color: Color(AppColors.PopupMeauButtonColor),),
        Container(width: 12,),
        Text(title, style: TextStyle(color: Color(AppColors.PopupMeauButtonColor)),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomBar = BottomNavigationBar(
      
      items: this._navigationViews.map((v)=>v.item).toList(),
      currentIndex: this._currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentIndex = index;    
          _pageController.animateToPage(
            _currentIndex, 
            duration: Duration(milliseconds: 200), 
            curve: Curves.easeInOut
          );
        });
      },
      fixedColor: const Color(AppColors.TabIconActiveColor),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(
                0xe65e,
                fontFamily: Constans.IconFontFamilt
              ),
              size: 22,
            ),
            onPressed: (){

            },
          ),
          Container(width: 16,),
          // 弹出下拉菜单
          PopupMenuButton(
            itemBuilder: (context){
              return <PopupMenuItem<ActionPopupItems>>[
                PopupMenuItem(
                  child: _buildPopupMeauItem(0xe69e, '发起群聊'),
                  value: ActionPopupItems.GRONP_CHART,
                ),
                PopupMenuItem(
                  child: _buildPopupMeauItem(0xe638, '添加朋友'),
                  value: ActionPopupItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMeauItem(0xe61b, '扫一扫'),
                  value: ActionPopupItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMeauItem(0xe62a, '收付款'),
                  value: ActionPopupItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMeauItem(0xe63d, '帮助与反馈'),
                  value: ActionPopupItems.HELP,
                ),
              ];
            },
            icon: Icon(
              IconData(
                0xe658,
                fontFamily: Constans.IconFontFamilt
              ),
              size: 22,
            ),
            onSelected: (ActionPopupItems selected) {  // 这里面传递的值就是itemBuilder list中每一项的value
              print(selected);
            },
            
          ),
          Container(width: 16,),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (context, index){
          return this._pageList[index];
        },
        itemCount: _pageList.length,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            this._currentIndex = index;            
          });
        },
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}