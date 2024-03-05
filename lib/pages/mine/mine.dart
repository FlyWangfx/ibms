import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/models/basic/app_module_mobile_model.dart';
import 'package:ibms/models/basic/user_info_model.dart';
import 'package:ibms/utils/other/routes.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List<AppModuleMobileModel> allModules = [
    AppModuleMobileModel(
      id: 'service',
      image: Icon(
        Icons.favorite,
        size: 23,
      ),
      text: '服务条款',
    ),
    AppModuleMobileModel(
      id: 'privacy',
      image: Icon(
        Icons.article,
        size: 23,
      ),
      text: '隐私政策',
    ),
    AppModuleMobileModel(
      id: 'version',
      image: Icon(
        Icons.perm_device_info,
        size: 23,
      ),
      text: '版本信息',
    ),
  ];

  late UserInfoModel _userInfo;
  TextStyle _style = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    _getLocalUserInfo();
  }

  void _getLocalUserInfo() async {
    setState(() {
      _userInfo = UserInfoModel(
        id: '001',
        account: 'admin',
        name: '管理员',
      );
    });
  }

  void _onClickExit() {
    Navigator.pushNamed(context, RouteSetting.LOGIN_PAGE_URL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TGAppBar(
        title: '我的',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              color: Colors.white,
              child: Column(
                children: [
                  SectionHead(
                    title: '个人信息',
                  ),
                  ListTile(
                    title: Text(
                      '头像',
                      style: _style,
                    ),
                    trailing: ClipOval(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                          child: Image(
                            image: UserInfoModel.defaultImage,
                            width: 5,
                            height: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text(
                      '账号',
                      style: _style,
                    ),
                    trailing: Text(
                      _userInfo.account,
                      style: _style,
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    title: Text(
                      '姓名',
                      style: _style,
                    ),
                    trailing: Text(
                      _userInfo.name,
                      style: _style,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              color: Colors.white,
              child: Column(
                children: [
                  SectionHead(
                    title: '系统信息',
                  ),
                  for (int i = 0; i < allModules.length; i++)
                    Column(
                      children: [
                        ListTile(
                          leading: allModules[i].image,
                          title: Text(
                            allModules[i].text!,
                            style: _style,
                          ),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                        i < allModules.length - 1 ? Divider(height: 1) : Container(),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 36),
              width: 240,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.red,
              ),
              child: TextButton(
                onPressed: () => _onClickExit(),
                child: const Text(
                  '退出登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
