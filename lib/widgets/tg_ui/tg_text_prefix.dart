import 'package:flutter/material.dart';

class TGTextPrefix extends StatefulWidget {
  final String text;
  final bool isNotNull;

  TGTextPrefix({
    Key? key,
    required this.text,
    this.isNotNull = false,
  }) : super(key: key);

  @override
  State<TGTextPrefix> createState() => _TGTextPrefixState();
}

class _TGTextPrefixState extends State<TGTextPrefix> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: widget.isNotNull,
          child: Container(
            margin: EdgeInsets.only(right: 1),
            child: const Icon(
              Icons.star,
              size: 7,
              color: Colors.red,
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
