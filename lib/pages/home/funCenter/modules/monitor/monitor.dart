import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/models/basic/app_module_mobile_model.dart';
import 'package:ibms/models/home/funCenter/monitor/monitor_device_model.dart';
import 'package:ibms/utils/other/routes.dart';
import 'package:ibms/widgets/tg_ui/tg_refresh.dart';

class Monitor extends StatefulWidget {
  final AppModuleMobileModel appModuleMobileModel;
  const Monitor({
    super.key,
    required this.appModuleMobileModel,
  });

  @override
  State<Monitor> createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  List<MonitorDevide> _list = [];
  int pageNum = 1;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _requestForList();
  }

  void _requestForList() {
    setState(() {
      _list.addAll(
        List.generate(
          20,
          (index) => MonitorDevide(
            name: '温湿度传感器',
            code: 'JSP-FS-KZX13',
            location: 'JSP-FS-KZX13',
            communicationType: '以太网',
            communicationProtocol: 'Modbus(TCP)',
            type: 1,
            status: 1,
            info: [
              MonitorInfo(time: '温度', status: '16℃'),
              MonitorInfo(time: '温度', status: '32℃'),
            ],
          ),
        ),
      );
      _total = _list.length;
    });
  }

  String _getTypeText(int type) {
    switch (type) {
      case 1:
        return '安防';
      default:
        return '';
    }
  }

  String _getStatusText(int status) {
    switch (status) {
      case 1:
        return '运行中';
      default:
        return '';
    }
  }

  Color _getStatusColor(int status) {
    switch (status) {
      case 1:
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  Widget listView() {
    return Scrollbar(
      radius: Radius.circular(10),
      thickness: 3,
      child: TGRefresh(
        onRefresh: () async {
          _list = [];
          this.pageNum = 1;
          _requestForList();
        },
        onLoad: _list.length < _total
            ? () async {
                this.pageNum++;
                _requestForList();
              }
            : null,
        isEmpty: _list.length == 0,
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 1);
          },
          itemCount: _list.length + 1,
          itemBuilder: (context, index) {
            if (index == _list.length)
              return Container(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    index == _total ? '没有更多数据' : '正在加载中...',
                    style: TextStyle(color: const Color(0xFF999999), fontSize: 14.0),
                  ),
                ),
              );
            MonitorDevide monitorDevide = _list[index];
            return ListTile(
              onTap: () => Navigator.pushNamed(context, RouteSetting.MONITORDETAIL, arguments: monitorDevide),
              title: Text(
                monitorDevide.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '设备编码   ' + monitorDevide.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '所在位置   ' + monitorDevide.location,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '设备类别   ' + _getTypeText(monitorDevide.type),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '状态          ' + _getStatusText(monitorDevide.status),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              trailing: BETag(
                text: _getStatusText(monitorDevide.status),
                backgroundColor: _getStatusColor(monitorDevide.status),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TGAppBar(
        title: '防盗报警系统设备',
      ),
      body: listView(),
    );
  }
}
