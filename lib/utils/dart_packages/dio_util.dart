import 'dart:convert' as convert;
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ibms/utils/other/routes.dart';
import 'package:ibms/utils/http/dio_http.dart';
import 'package:ibms/widgets/components/dialog/easy_dialog.dart';

class DioUtil {
  static String? hostUrl;
  static String? envId;

  /// bimServiceUrl
  static String? _bimServiceUrl;

  static String? get bimServiceUrl => _bimServiceUrl;

  static set bimServiceUrl(String? value) {
    _bimServiceUrl = value;
    if (value != null && value.isNotEmpty) DioHttp.bimServiceUrl = value;
  }

  /// author
  static String? _author;

  static String? get author => _author;

  static set author(String? value) {
    _author = value;
    if (value != null && value.isNotEmpty) DioHttp.bearAuth = value;
  }

  static bool debugPrint = true;

  static String? path;
  static String homePage = "";
  static bool initHomePage = false;

  static String? get hostFile {
    if (DioUtil.hostUrl != null && DioUtil.hostUrl!.isNotEmpty) {
      return '${DioUtil.hostUrl}/file/';
    }
    return null;
  }

  static bool get isHaveToken {
    return author == null ? false : true;
  }

  static Future<dynamic> _request(
    String urlSuffix, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
    required Options options,
    required bool showErrorMsg,
  }) async {
    String url = '${baseUrl ?? DioUtil.hostUrl}$urlSuffix';
    try {
      EasyLoading.show(status: '加载中');
    } catch (e) {
      print(e);
    }

    try {
      late Response response;
      if (options.method == 'GET') {
        response = await DioHttp.instance().get(
          url,
          queryParameters: queryParameters,
          options: options,
        );
      } else if (options.method == 'POST') {
        response = await DioHttp.instance().post(
          url,
          queryParameters: queryParameters,
          data: data,
          options: options,
        );
      }
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        var obj = _dealResponse(response, showErrorMsg);
        return obj;
      } else {
        EasyDialog.showAlert(message: '服务器异常,请稍后重试');
      }
    } on DioException catch (e) {
      EasyLoading.dismiss();
      String retry = '请稍后重试';
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          EasyDialog.showAlert(error: '连接服务器超时,$retry');
          break;
        default:
          EasyDialog.showAlert(error: '网络出现错误,$retry');
          break;
      }
    }
  }

  static Future<dynamic> get(
    String urlSuffix, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool showErrorMsg = true,
  }) async {
    Options op = Options(method: 'GET');
    if (options != null) {
      op = options.copyWith(method: 'GET');
    }
    var obj = await _request(
      urlSuffix,
      baseUrl: baseUrl,
      queryParameters: queryParameters,
      options: op,
      showErrorMsg: showErrorMsg,
    );
    return obj;
  }

  static Future<dynamic> post(
    String urlSuffix, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    data,
    Options? options,
    bool showErrorMsg = true,
  }) async {
    Options op = Options(method: 'POST');
    if (options != null) {
      op = options.copyWith(method: 'POST');
    }
    var obj = await _request(
      urlSuffix,
      baseUrl: baseUrl,
      queryParameters: queryParameters,
      data: data,
      options: op,
      showErrorMsg: showErrorMsg,
    );
    return obj;
  }

  // 判断state
  static dynamic _dealResponse(Response response, bool showErrorMsg) {
    Map<String, dynamic> data;
    if (response.data is String) {
      data = convert.jsonDecode(response.data);
    } else {
      data = response.data;
    }

    if (DioHttp.state_success.contains(data['state'])) {
      return data['obj'];
    } else {
      _dealStateError(data, showErrorMsg);
    }
  }

  static _dealStateError(Map data, bool showErrorMsg) {
    String? state = data['state'];
    String? msg = data['msg'];
    switch (state) {
      case '1':
      case '3':
        _reLogin(msg ?? '请重新登录', RouteSetting.LOGIN_PAGE_URL);
        break;
      case '2':
        EasyDialog.showAlert(message: msg ?? '您没有权限,请联系管理员');
        break;
      case '4':
        _reLogin(msg ?? '', RouteSetting.LOGIN_PAGE_URL);
        break;
      default:
        if (showErrorMsg) {
          EasyDialog.showAlert(error: msg ?? '网络出现错误,请稍后重试');
          break;
        }
    }
  }

  static _reLogin(String? msg, String route) async {
    EasyDialog.showAlert(
      message: msg ?? '您的帐号在其它地方登录，您已被迫下线，如果不是您本人操作，请及时修改密码',
      onPressedConfirm: () async {
        RouteSetting.logout(route: route);
      },
    );
  }
}
