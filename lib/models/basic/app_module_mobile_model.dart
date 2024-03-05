import 'package:flutter/material.dart';

class AppModuleMobileModel {
  String? id;
  String? icon;
  Widget? image;
  String? text;
  String? route;
  Widget? page;
  String? url;

  /// 特有字段
  bool? isShow;

  /// AppModuleNetModel字段
  String? name;

  AppModuleMobileModel({
    this.id,
    this.icon,
    this.image,
    this.text,
    this.route,
    this.page,
    this.url,
    this.isShow,
    this.name,
  });
}
