import 'package:flutter/material.dart';
import 'package:ibms/utils/other/routes.dart';

class RealWarning extends StatefulWidget {
  const RealWarning({super.key});

  @override
  State<RealWarning> createState() => _RealWarningState();
}

class _RealWarningState extends State<RealWarning> {
  List _realWarning = [
    '消防系统-B1F层001手动挡按钮发出警报',
    '照明系统-10F层005照明回路故障警报',
    '消防电源主机发生了通讯故障',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Icon(
                Icons.notifications_none,
                size: 80,
              ),
              Container(
                width: 20,
                child: Text('实时预警'),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _realWarning.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, RouteSetting.MESSAGE),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Text(_realWarning[i], overflow: TextOverflow.ellipsis),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
