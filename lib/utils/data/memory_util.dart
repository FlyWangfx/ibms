import 'dart:convert';

import 'package:be_login/model/login_model.dart';
import 'package:collection/collection.dart';
import 'package:ibms/utils/flutter_plugins/shared_preferences_util.dart';
import 'package:ibms/utils/dart_packages/dio_util.dart';

class MemoryUtil {
  /// 单例
  MemoryUtil._();

  static final MemoryUtil _instance = MemoryUtil._();

  factory MemoryUtil.instance() => _instance;

  /// 账户
  List<LoginModel>? _accounts;

  Future<List<LoginModel>?> getAccounts() async {
    if (_accounts == null) {
      List<String>? stringList = await SharedPreferenceUtil.getStringList(LoginModel.storage_key);
      if (stringList != null) {
        List<LoginModel> accounts = stringList.map<LoginModel>((e) => LoginModel.fromJson(json.decode(e))).toList();
        _accounts = accounts;
      }
    }
    return _accounts;
  }

  Future<List<LoginModel>?> getAccountsWithHost(String host) async {
    List<LoginModel>? accounts = await getAccounts();
    List<LoginModel>? sameHostAccounts = accounts?.where((element) => element.host == host).toList();
    return sameHostAccounts;
  }

  Future<LoginModel?> getFirstAccount(String host) async {
    List<LoginModel>? sameHostAccounts = await getAccountsWithHost(host);
    return sameHostAccounts?.first;
  }

  Future<bool> setAccount(LoginModel value) async {
    List<LoginModel>? accounts = await getAccounts();
    if (accounts != null) {
      LoginModel? loginModel = accounts.firstWhereOrNull((LoginModel element) => element.isEqualTo(value));
      if (loginModel != null) {
        loginModel.password = value.password;
      } else {
        accounts.insert(0, value);
      }
    } else {
      accounts = [value];
    }

    /// 更新内存
    _accounts = accounts;
    return _updateAccount();
  }

  Future<bool> deleteAccount(LoginModel value) async {
    bool? success = _accounts?.remove(value);
    await _updateAccount();
    return success == true;
  }

  Future<bool> deleteFirstAccount() async {
    LoginModel? value = await getFirstAccount(DioUtil.hostUrl!);
    if (value != null) return deleteAccount(value);
    return false;
  }

  Future<bool> _updateAccount() async {
    /// 存储
    List<String> stringList = _accounts!.map((e) => e.toString()).toList();
    return SharedPreferenceUtil.setStringList(LoginModel.storage_key, stringList);
  }
}
