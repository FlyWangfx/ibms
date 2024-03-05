import 'package:flutter/material.dart';
import 'package:ibms/models/basic/app_module_mobile_model.dart';
import 'package:ibms/res/assets_res.dart';
import 'package:ibms/utils/other/routes.dart';
import 'package:ibms/widgets/tg_ui/tg_gridview.dart';

class FunCenter extends StatelessWidget {
  FunCenter({super.key});

  final List<AppModuleMobileModel> allModules = [
    AppModuleMobileModel(
      icon: AssetsRes.MONITOR,
      text: '设备监控',
      route: RouteSetting.MONITOR,
      isShow: false,
    ),
    AppModuleMobileModel(
      icon: AssetsRes.MAJOR_ISSUES_REPORT,
      text: '报警中心',
      route: RouteSetting.WARNING_PAGE_URL,
      isShow: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TGGridView(
          displayModules: allModules,
          onPressed: (AppModuleMobileModel model) => Navigator.pushNamed(context, model.route!, arguments: model),
        ),
      ],
    );
  }
}
