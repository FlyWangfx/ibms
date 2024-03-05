import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/models/home/funCenter/monitor/monitor_device_model.dart';

class MonitorDetail extends StatelessWidget {
  final MonitorDevide monitorDevide;
  MonitorDetail({
    super.key,
    required this.monitorDevide,
  });

  final List<String> defaultColumns = ['时间', '状态'];

  Widget foundation() {
    return Column(
      children: [
        SectionHead(title: '基础信息'),
        SizedBox(height: 10),
        Row(
          children: [
            Text('设备名称'),
            Expanded(
              child: Text(
                monitorDevide.name,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Text('型号'),
            Expanded(
              child: Text(
                monitorDevide.code,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Text('通讯方式'),
            Expanded(
              child: Text(
                monitorDevide.communicationType,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            Text('通信协议'),
            Expanded(
              child: Text(
                monitorDevide.communicationProtocol,
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget monitorInfo() {
    List<List<TableRowModel>> _rows = monitorDevide.info.map((e) {
      return [
        TableRowModel(value: e.time),
        TableRowModel(value: e.status),
      ];
    }).toList();
    return Column(
      children: [
        SectionHead(title: '监测信息'),
        SizedBox(height: 10),
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: <Widget>[
                for (String head in defaultColumns)
                  TableCell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      height: 30,
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                      child: Text(
                        head,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
            for (List<TableRowModel> row in _rows)
              TableRow(
                children: [
                  for (TableRowModel r in row)
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        height: 30,
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        child: Text(
                          r.value,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TGAppBar(title: '设备详情'),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          foundation(),
          SizedBox(height: 20),
          monitorInfo(),
        ],
      ),
    );
  }
}
