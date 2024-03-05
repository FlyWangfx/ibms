import 'package:flutter/material.dart';
import 'package:ibms/models/basic/app_module_mobile_model.dart';
import 'package:ibms/pages/home/home.dart';
import 'package:ibms/pages/message/message.dart';
import 'package:ibms/pages/mine/mine.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  List<AppModuleMobileModel> tabModules = [
    AppModuleMobileModel(
      id: 'home',
      image: Icon(Icons.home),
      text: '首页',
      page: Home(),
    ),
    AppModuleMobileModel(
      id: 'message',
      image: Icon(Icons.mail),
      text: '通知',
      page: Messages(),
    ),
    AppModuleMobileModel(
      id: 'mine',
      image: Icon(Icons.person),
      text: '我的',
      page: MinePage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabModules[_selectedIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(50, 144, 239, 1),
        iconSize: 25.0,
        items: tabModules.asMap().keys.map((index) {
          AppModuleMobileModel model = tabModules[index];
          return BottomNavigationBarItem(
            icon: model.image!,
            label: model.text,
          );
        }).toList(),
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          return;
        },
      ),
    );
  }
}
