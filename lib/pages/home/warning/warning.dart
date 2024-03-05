import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/models/home/warning/warning_model.dart';
import 'package:ibms/utils/other/routes.dart';
import 'package:ibms/utils/other/sx_date.dart';
import 'package:ibms/widgets/components/empty.dart';
import 'package:ibms/widgets/components/home/warning/warning_list_view.dart';
import 'package:ibms/widgets/components/home/warning/warning_search_button.dart';
import 'package:ibms/widgets/tg_ui/tg_datePicker.dart';
import 'package:ibms/widgets/tg_ui/tg_search.dart';

class WarningPage extends StatefulWidget {
  WarningPage({
    Key? key,
  }) : super(key: key);

  _WarningPageState createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  List<WarningModel> warningModelList = [];
  DateTime _sDate = DateTime.now();
  DateTime _eDate = DateTime.now();

  int tabIndex = 0;
  List<Map<String, dynamic>> tabDataList = [
    {'title': '全部', 'count': 23},
    {'title': '待处理', 'count': 10},
    {'title': '处理中', 'count': 7},
    {'title': '已完成', 'count': 6},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _addListener();
    _initData();
  }

  void _addListener() {
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation!.value) {
        tabIndex = _tabController.index;
      }
    });
  }

  void _initData() {
    warningModelList.add(WarningModel(
      name: '光伏电站XX报警',
      level: 1,
      status: 0,
      faultDevice: '1#逆变器',
      devicePosition: '1FA001区域',
      faultPhenomenon: '通讯接口损失，请厂家维修',
      findDate: '2023-07-04',
    ));
    warningModelList.add(WarningModel(
      name: '光伏电站XX报警',
      level: 2,
      status: 1,
      faultDevice: '1#逆变器',
      devicePosition: '1FA001区域',
      faultPhenomenon: '',
      findDate: '2023-07-05',
    ));
    warningModelList.add(WarningModel(
      name: '光伏电站XX报警',
      level: 3,
      status: 2,
      faultDevice: '1#逆变器',
      devicePosition: '1FA001区域',
      faultPhenomenon: '',
      findDate: '2023-07-06',
    ));
    warningModelList.add(WarningModel(
      name: '光伏电站XX报警',
      level: 3,
      status: 0,
      faultDevice: '1#逆变器',
      devicePosition: '1FA001区域',
      faultPhenomenon: '',
      findDate: '2023-07-07',
    ));
    warningModelList.add(WarningModel(
      name: '光伏电站XX报警',
      level: 3,
      status: 0,
      faultDevice: '1#逆变器',
      devicePosition: '1FA001区域',
      faultPhenomenon: '',
      findDate: '2023-07-08',
    ));
    warningModelList.add(WarningModel(
      name: '光伏电站XX报警',
      level: 3,
      status: 0,
      faultDevice: '1#逆变器',
      devicePosition: '1FA001区域',
      faultPhenomenon: '',
      findDate: '2023-07-07',
    ));
  }

  void _onClickToSearch() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _onClickToDetail(WarningModel item) {
    Navigator.pushNamed(context, RouteSetting.WARNING_DETAIL_PAGE_URL, arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: TGAppBar(
        title: '报警工单',
        actions: [Container()],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabDataList.asMap().keys.map<Widget>((index) {
            Map tabDataItem = tabDataList.elementAt(index);
            return Tab(
              child: Text(
                "${tabDataItem['title']}(${tabDataItem['count']})",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: tabIndex == index ? Colors.black : Colors.black.withOpacity(0.5),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Column(
            children: [
              WarningSearchButton(
                onClick:  () => _onClickToSearch(),
              ),
              Expanded(
                child: warningModelList.length > 0
                    ? WarningListView(
                        warningModelList: warningModelList,
                        onClickToDetail: (model) => _onClickToDetail(model),
                      )
                    : EmptyPage(),
              )
            ],
          ),
          Column(
            children: [
              WarningSearchButton(
                onClick:  () => _onClickToSearch(),
              ),
              Expanded(
                child: warningModelList.length > 0
                    ? WarningListView(
                        warningModelList: warningModelList,
                        onClickToDetail: (model) => _onClickToDetail(model),
                      )
                    : EmptyPage(),
              )
            ],
          ),
          Column(
            children: [
              WarningSearchButton(
                onClick:  () => _onClickToSearch(),
              ),
              Expanded(
                child: warningModelList.length > 0
                    ? WarningListView(
                        warningModelList: warningModelList,
                        onClickToDetail: (model) => _onClickToDetail(model),
                      )
                    : EmptyPage(),
              )
            ],
          ),
          Column(
            children: [
              WarningSearchButton(
                onClick:  () => _onClickToSearch(),
              ),
              Expanded(
                child: warningModelList.length > 0
                    ? WarningListView(
                        warningModelList: warningModelList,
                        onClickToDetail: (model) => _onClickToDetail(model),
                      )
                    : EmptyPage(),
              )
            ],
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              child: const DrawerHeader(
                child: Text('关键字搜索'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: Colors.white),
              child: TGSearch(
                hintText: '关键字搜索',
                trailingText: '',
                onClick: (keyWords) async {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(color: Colors.white),
              child: ListTile(
                leading: Text(
                  '时间:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TGDatePicker(
                        date: _sDate,
                        onChangeDate: (DateTime date) async {
                          DateTime val = await SXDate.datePicker(context, date);
                          setState(() {
                            _sDate = val;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text('~'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TGDatePicker(
                        date: _eDate,
                        onChangeDate: (DateTime date) async {
                          DateTime val = await SXDate.datePicker(context, date);
                          setState(() {
                            _eDate = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: 100,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '重置',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: 100,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '查询',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
