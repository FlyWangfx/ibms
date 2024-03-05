import 'package:flutter/material.dart';
import 'package:ibms/res/assets_res.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.inbox,
            size: 150,
            color: Colors.grey,
          ),
          Text('暂无数据'),
        ],
      ),
    );
  }
}

//首页空页面
class HomeEmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; //获取当前屏幕宽度

    return Container(
      child: Column(
        children: [
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.fromLTRB(180, 20, 10, 10),
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  child: Stack(children: <Widget>[
                    new Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                      height: 40,
                    ),
                  ]),
                  color: Color(0x0c000000),
                  height: 100,
                  width: width / 2 - 15,
                ),
                Container(
                  // padding: EdgeInsets.fromLTRB(180, 20, 10, 10),
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  child: Stack(children: <Widget>[
                    new Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                      height: 40,
                    ),
                  ]),
                  color: Color(0x0c000000),
                  height: 100,
                  width: width / 2 - 15,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.fromLTRB(180, 20, 10, 10),
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  child: Stack(children: <Widget>[
                    new Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                      height: 40,
                    ),
                  ]),
                  color: Color(0x0c000000),
                  height: 100,
                  width: width / 2 - 15,
                ),
                Container(
                  // padding: EdgeInsets.fromLTRB(180, 20, 10, 10),
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  child: Stack(children: <Widget>[
                    new Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                      height: 40,
                    ),
                  ]),
                  color: Color(0x0c000000),
                  height: 100,
                  width: width / 2 - 15,
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(""),
          ),
          Container(alignment: Alignment.bottomCenter, color: Color(0x0c000000), height: 60, width: width)
        ],
      ),
    );
  }
}

class ProjectEmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 220.0,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.blue,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(AssetsRes.BG_01),
                              fit: BoxFit.cover,
                            )),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 24)),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AssetsRes.PROJECT,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
