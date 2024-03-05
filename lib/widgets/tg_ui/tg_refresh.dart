import 'dart:async';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class TGRefresh extends StatelessWidget {
  final Widget body;
  final FutureOr Function()? onRefresh;
  final FutureOr Function()? onLoad;
  final bool isEmpty;

  const TGRefresh({
    Key? key,
    required this.body,
    this.onRefresh,
    this.onLoad,
    this.isEmpty = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      child: isEmpty ? Container() : body,
      onRefresh: onRefresh,
      onLoad: onLoad,
    );
  }
}
