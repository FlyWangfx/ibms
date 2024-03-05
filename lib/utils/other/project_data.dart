import 'package:ibms/utils/flutter_plugins/shared_preferences_util.dart';

class ProjectData {
  static ProjectData? _instance;

  /// _loginTokenLocal
  String? _loginToken;

  Future<String?> getLoginToken() async {
    if (_loginToken == null) {
      String? string = await SharedPreferenceUtil.getString(SharedPreferenceUtil.ACCESS_TOKEN);
      _loginToken = string;
    }
    return _loginToken;
  }

  ProjectData._internal() {
    // 初始化
  }

  static ProjectData getInstance() {
    if (_instance == null) {
      _instance = new ProjectData._internal();
    }
    return _instance!;
  }

}
