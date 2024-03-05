import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ibms/pages/home/equipment_count/equipment_count.dart';
import 'package:ibms/pages/home/funCenter/funCenter.dart';
import 'package:ibms/pages/home/location/location.dart';
import 'package:ibms/pages/home/notices/notices.dart';
import 'package:ibms/pages/home/real_warning/real_warning.dart';
import 'package:ibms/res/assets_res.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const EdgeInsets cardPadding = EdgeInsets.fromLTRB(18, 4, 24, 6);
    const EdgeInsets cardMargin = EdgeInsets.fromLTRB(8, 14, 8, 6);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      image: AssetImage(AssetsRes.HOME_BG),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: BECard(margin: cardMargin, padding: cardPadding, child: Location()),
              ),
            ],
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BECard(margin: cardMargin, padding: cardPadding, child: FunCenter()),
                    BECard(margin: cardMargin, padding: cardPadding, child: Notices()),
                    BECard(margin: cardMargin, padding: cardPadding, child: RealWarning()),
                    BECard(margin: cardMargin, padding: cardPadding, child: EquipmentCount()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
