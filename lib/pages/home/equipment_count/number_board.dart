import 'package:be_widgets/be_widgets.dart';
import 'package:flutter/material.dart';

class CockpitNumberItem {
  final String number;
  final String? unit;
  final String text;
  final Widget? child;

  CockpitNumberItem({
    required this.number,
    this.unit,
    required this.text,
    this.child,
  });
}

class CockpitNumberBoard extends StatelessWidget {
  final List<CockpitNumberItem> children;

  const CockpitNumberBoard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (CockpitNumberItem item in children)
                BENumberText(
                  alignment: CrossAxisAlignment.start,
                  number: item.number,
                  numberColor: Colors.black,
                  numberFontSize: 20,
                  unit: item.unit,
                  text: item.text,
                  textColor: Colors.black,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
