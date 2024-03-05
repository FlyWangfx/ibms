import 'package:flutter/material.dart';

class WarningSearchButton extends StatefulWidget {
  final void Function() onClick;

  WarningSearchButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  State<WarningSearchButton> createState() => _WarningSearchState();
}

class _WarningSearchState extends State<WarningSearchButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 36),
      width: 300,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () => widget.onClick(),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.black.withOpacity(0.2),
            ),
            Text(
              '关键字搜索',
              style: TextStyle(
                color: Colors.black.withOpacity(0.2),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

}