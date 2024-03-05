import 'package:flutter/material.dart';
import 'package:ibms/utils/other/routes.dart';

class Notices extends StatefulWidget {
  const Notices({super.key});

  @override
  State<Notices> createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  List _notices = [
    '通知:为了保证xxx活动正常进行,即日起进出大厅需要进行实名认证',
    '通知:为了保证xxx活动正常进行,即日起进出大厅需要进行实名认证',
    '通知:为了保证xxx活动正常进行,即日起进出大厅需要进行实名认证',
  ];
  int _nowIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteSetting.MESSAGE),
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  _nowIndex = value;
                });
              },
              itemCount: _notices.length,
              itemBuilder: (context, i) {
                return Text(
                  _notices[i],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: List.generate(_notices.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                    color: _nowIndex == index ? Colors.black : Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
