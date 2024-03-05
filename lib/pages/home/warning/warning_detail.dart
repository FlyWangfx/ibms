import 'dart:io';
import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/models/basic/user_info_model.dart';
import 'package:ibms/models/home/warning/warning_model.dart';
import 'package:ibms/widgets/components/image_upload.dart';
import 'package:ibms/widgets/tg_ui/tg_text.dart';

class WarningDetailPage extends StatefulWidget {
  final WarningModel warningModel;

  WarningDetailPage({
    Key? key,
    required this.warningModel,
  }) : super(key: key);

  _WarningDetailState createState() => _WarningDetailState();
}

class _WarningDetailState extends State<WarningDetailPage> {
  late final TextEditingController _content = TextEditingController();
  late UserInfoModel _userInfo;
  TextStyle _style = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  List<File> _uploadImgList = [];

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

  void _onClickSubmit() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TGAppBar(
        title: '工单详情',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '标题',
                    style: _style,
                  ),
                  trailing: Text(
                    widget.warningModel.name,
                    style: _style,
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    '报警等级',
                    style: _style,
                  ),
                  trailing: Text(
                    widget.warningModel.levelName,
                    style: _style,
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    '设备名称',
                    style: _style,
                  ),
                  trailing: Text(
                    widget.warningModel.faultDevice,
                    style: _style,
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    '创建时间',
                    style: _style,
                  ),
                  trailing: Text(
                    widget.warningModel.findDate,
                    style: _style,
                  ),
                ),
                Divider(height: 1),
                ListTile(
                  title: Text(
                    '故障描述',
                    style: _style,
                  ),
                  trailing: Text(
                    widget.warningModel.faultPhenomenon,
                    style: _style,
                  ),
                ),
                Divider(height: 1),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image(
                          image: UserInfoModel.defaultImage,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image(
                          image: UserInfoModel.defaultImage,
                          width: 55,
                          height: 55,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image(
                          image: UserInfoModel.defaultImage,
                          width: 55,
                          height: 55,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Column(
              children: [
                SectionHead(
                  title: '维修信息',
                ),
                Column(
                  children: [
                    ListTile(
                      title: Text(
                        '维修人',
                        style: _style,
                      ),
                      trailing: Text(
                        _userInfo.name,
                        style: _style,
                      ),
                    ),
                    Divider(height: 1),
                    ListTile(
                      title: Text(
                        '维修状态',
                        style: _style,
                      ),
                      trailing: Text(
                        widget.warningModel.statusName,
                        style: _style,
                      ),
                    ),
                    Divider(height: 1),
                    Container(
                      height: 48,
                      child: TGText(
                        prefixText: '维修说明',
                        isNotNull: true,
                        type: 'text',
                        hintText: '请输入维修说明...',
                        text: _content,
                      ),
                    ),
                    Divider(height: 1),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ImageUpload(
                        imgFileList: _uploadImgList,
                        rightFlex: 6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 36),
            width: 200,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.blue,
            ),
            child: TextButton(
              onPressed: () => _onClickSubmit(),
              child: const Text(
                '提交',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
