import 'package:flutter/material.dart';
import 'package:ibms/pages/common/login/login.dart';
import 'package:ibms/pages/common/tabs.dart';
import 'package:ibms/pages/home/funCenter/modules/monitor/monitor.dart';
import 'package:ibms/pages/home/funCenter/modules/monitor/monitor_detail.dart';
import 'package:ibms/pages/home/home.dart';
import 'package:ibms/pages/home/warning/warning_detail.dart';
import 'package:ibms/pages/message/message.dart';
import 'package:ibms/pages/home/warning/warning.dart';
import 'package:ibms/utils/flutter_plugins/shared_preferences_util.dart';
import 'package:ibms/widgets/components/photo_only_view.dart';

typedef ArgumentsWidgetBuilder = Widget Function(BuildContext context, {dynamic arguments});

class RouteSetting {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void logout({
    required String route,
    BuildContext? context,
  }) async {
    await SharedPreferenceUtil.removeLocalAll();
    NavigatorState? navigatorState = context != null ? Navigator.of(context) : navigatorKey.currentState;
    navigatorState?.pushNamedAndRemoveUntil(route, (route) => false);
  }

  static const String LOGIN_PAGE_URL = '/login';
  static const String TAB_PAGE_URL = '/tabs';
  static const String HOME = '/home';
  static const String MONITOR = '/monitor';
  static const String MONITORDETAIL = '/monitorDetail';
  static const String MESSAGE = '/message';
  static const String WARNING_PAGE_URL = '/warning';
  static const String WARNING_DETAIL_PAGE_URL = '/warningDetail';
  static const String PHOTO_ONLY_VIEW_PAGE_URL = '/photoOnlyView';

  /// 配置路由
  static final Map<String, ArgumentsWidgetBuilder> routes = {
    /// 登录
    LOGIN_PAGE_URL: (context, {arguments}) => LoginHomePage(),
    TAB_PAGE_URL: (context, {arguments}) => Tabs(),
    HOME: (context, {arguments}) => Home(),
    MONITOR: (context, {arguments}) => Monitor(appModuleMobileModel: arguments),
    MONITORDETAIL: (context, {arguments}) => MonitorDetail(monitorDevide: arguments),
    MESSAGE: (context, {arguments}) => Messages(),

    /// 报警中心
    WARNING_PAGE_URL: (context, {arguments}) => WarningPage(),
    WARNING_DETAIL_PAGE_URL: (context, {arguments}) => WarningDetailPage(warningModel: arguments),

    /// 照片大图显示
    PHOTO_ONLY_VIEW_PAGE_URL: (context, {arguments}) => PhotoOnlyViewPage(imageProvider: arguments),
  };

  static RouteFactory? onGenerateRoute = (RouteSettings settings) {
    ArgumentsWidgetBuilder pageBuilder = routes[settings.name]!;
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return pageBuilder(context, arguments: settings.arguments);
      },
      settings: settings,
    );
  };
}
