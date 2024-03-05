import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/widgets/tg_ui/tg_refresh.dart';
import 'package:ibms/widgets/tg_ui/tg_search.dart';
import 'dart:math';

class NoticeModel {
  String title;
  String time;
  int status;
  int type;

  NoticeModel({
    required this.title,
    required this.time,
    required this.status,
    required this.type,
  });
}

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with TickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;
  List<Map<String, dynamic>> tabDataList = [
    {'title': '报警', 'count': 0},
    {'title': '通知', 'count': 0},
  ];

  int pageSize = 15;
  int pageNum = 1;
  int _total = 0;
  List<NoticeModel> _noticeList = [];

  @override
  void initState() {
    super.initState();
    _requestForList();
    _tabController = TabController(length: 2, vsync: this);
    _addListener();
  }

  void _requestForList() {
    if (tabIndex == 0) {
      pageNum = 1;
      setState(() {
        _noticeList.addAll(
          List.generate(
            20,
            (index) => NoticeModel(
              title: 'xxx设备xxx健康内容有异常$index',
              time: '2023-07-04',
              status: 1,
              type: 1,
            ),
          ),
        );
        _total = 100;
      });
    } else {
      pageNum = 1;
      setState(() {
        _noticeList.addAll(
          List.generate(
            20,
            (index) => NoticeModel(
              title: '祝大家中秋节快乐$index',
              time: '2023-07-04',
              status: 1,
              type: 2,
            ),
          ),
        );
        _total = _noticeList.length;
      });
    }
  }

  void _addListener() {
    _tabController.addListener(() {
      if (_tabController.index == _tabController.animation!.value) {
        tabIndex = _tabController.index;
        _noticeList = [];
        pageNum = 1;
        _requestForList();
      }
    });
  }

  Widget noticeListView() {
    return Scrollbar(
      radius: Radius.circular(10),
      thickness: 3,
      child: TGRefresh(
        onRefresh: () async {
          _noticeList = [];
          pageNum = 1;
          _requestForList();
        },
        onLoad: _noticeList.length < _total
            ? () async {
                pageNum++;
                _requestForList();
              }
            : null,
        isEmpty: _noticeList.length == 0,
        body: ListView.separated(
          key: PageStorageKey(1),
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: _noticeList.length + 1,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            if (index == _noticeList.length)
              return Container(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    index == _total ? '没有更多数据' : '正在加载中...',
                    style: TextStyle(color: const Color(0xFF999999), fontSize: 14.0),
                  ),
                ),
              );
            NoticeModel noticeModel = _noticeList.elementAt(index);
            return ListTile(
              leading: BETag(
                text: noticeModel.type == 1 ? '预警' : '通知',
                backgroundColor: noticeModel.type == 1 ? Colors.orange : Colors.green,
              ),
              title: Text(
                noticeModel.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                noticeModel.time,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: ClipPath(
                clipper: TrianglePath(),
                child: Container(
                  height: 60,
                  width: 60,
                  color: noticeModel.status == 1 ? Colors.grey : Colors.blue,
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(10.0, -5.0),
                      child: Transform.rotate(
                        angle: pi / 5,
                        child: Text(noticeModel.status == 1 ? '已读' : '未读'),
                      ),
                    ),
                  ),
                ),
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
          title: '消息通知',
          toolbarHeight: 80,
          bottom: TabBar(
            controller: _tabController,
            tabs: tabDataList.asMap().keys.map<Widget>((index) {
              Map tabDataItem = tabDataList.elementAt(index);
              return Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tabDataItem["title"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: tabIndex == index ? Colors.black : Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 25,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(139, 200, 223, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "${tabDataItem['count']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        body: Column(
          children: [
            TGSearch(
              hintText: '请输入要查找的内容',
              trailingText: '查询',
              onClick: (keyword) async {
                List<NoticeModel> list = _noticeList.where((element) => element.title.contains(keyword)).toList();
                setState(() {
                  _noticeList = list;
                });
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  // 报警
                  Column(
                    children: [
                      Expanded(
                        child: _noticeList.length > 0 ? noticeListView() : Container(),
                      )
                    ],
                  ),
                  // 通知
                  Column(
                    children: [
                      Expanded(
                        child: _noticeList.length > 0 ? noticeListView() : Container(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class TrianglePath extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
