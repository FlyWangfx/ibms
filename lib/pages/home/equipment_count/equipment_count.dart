import 'package:flutter/material.dart';
import 'package:ibms/pages/home/equipment_count/number_board.dart';

class EquipmentCount extends StatefulWidget {
  const EquipmentCount({super.key});

  @override
  State<EquipmentCount> createState() => _EquipmentCountState();
}

class _EquipmentCountState extends State<EquipmentCount> {
  int _equipmentTotal = 0;
  int _workingCount = 0;
  int _alarmCount = 0;
  int _faultCount = 0;

  @override
  void initState() {
    super.initState();
    _requestForCount();
  }

  void _requestForCount() {
    setState(() {
      _equipmentTotal = 268;
      _workingCount = 18;
      _alarmCount = 18;
      _faultCount = 18;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CockpitNumberBoard(
      children: <CockpitNumberItem>[
        CockpitNumberItem(
          number: _equipmentTotal.toString(),
          text: '设备总数',
        ),
        CockpitNumberItem(
          number: _workingCount.toString(),
          text: '运行中',
        ),
        CockpitNumberItem(
          number: _alarmCount.toString(),
          text: '报警中',
        ),
        CockpitNumberItem(
          number: _faultCount.toString(),
          text: '实时故障',
        ),
      ],
    );
  }
}
