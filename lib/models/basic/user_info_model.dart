import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ibms/res/assets_res.dart';

class UserInfoModel {
  static ImageProvider defaultImage = AssetImage(AssetsRes.HEADER);
  static const String key = 'UserInfoModel';

  String id;
  String account;
  String name;
  String? icon;

  UserInfoModel({
    required this.id,
    required this.account,
    required this.name,
    this.icon,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserInfoModel(
      id: parsedJson['id'],
      account: parsedJson['account'],
      name: parsedJson['name'],
      icon: parsedJson['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'account': account,
        'name': name,
        'icon': icon,
      };

  @override
  String toString() {
    Map jsonMap = this.toJson();
    String jsonString = json.encode(jsonMap);
    return jsonString;
  }
}
