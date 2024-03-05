import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/models/home/warning/warning_model.dart';

class WarningListView extends StatefulWidget {
  final List<WarningModel> warningModelList;
  final void Function(WarningModel model) onClickToDetail;

  WarningListView({
    Key? key,
    required this.warningModelList,
    required this.onClickToDetail,
  }) : super(key: key);

  @override
  State<WarningListView> createState() => _WarningListViewState();
}

class _WarningListViewState extends State<WarningListView> {
  Map<int, Color> levelColorMap = {
    1: Color.fromRGBO(236, 128, 141, 1),
    2: Color.fromRGBO(250, 205, 145, 1),
    3: Color.fromRGBO(191, 191, 1, 1),
  };

  Map<int, Color> statusColorMap = {
    0: Color.fromRGBO(245, 154, 35, 1),
    1: Color.fromRGBO(76, 106, 253, 1),
    2: Color.fromRGBO(183, 183, 183, 1),
  };

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: PageStorageKey(1),
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: widget.warningModelList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        WarningModel warningModel = widget.warningModelList[index];
        return Row(
          children: [
            Expanded(
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      warningModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    BETag(
                      text: '${warningModel.levelName}',
                      backgroundColor: levelColorMap[warningModel.level]!,
                    )
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '故障设备：${warningModel.faultDevice}',
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '设备位置：${warningModel.devicePosition}',
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '故障现象：${warningModel.faultPhenomenon}',
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '发现时间：${warningModel.findDate}',
                      style: TextStyle(fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                onTap: () => widget.onClickToDetail(warningModel),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10),
              width: 35,
              height: 100,
              color: statusColorMap[warningModel.status],
              child: Text(
                '${warningModel.statusName}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}