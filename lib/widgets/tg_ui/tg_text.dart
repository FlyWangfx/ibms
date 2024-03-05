import 'package:flutter/material.dart';
import 'package:ibms/widgets/tg_ui/tg_text_prefix.dart';

typedef TextClickedCallback = void Function();

class TGText extends StatefulWidget {
  final String prefixText;
  final bool isNotNull;
  final String type; //text:文本框；select:选择框
  final String? hintText;
  final TextEditingController? text;
  final String? selectStr;
  final TextClickedCallback? onClick;

  TGText({
    Key? key,
    required this.prefixText,
    this.isNotNull = false,
    required this.type,
    this.hintText,
    this.text,
    this.selectStr,
    this.onClick,
  }) : super(key: key);

  @override
  State<TGText> createState() => _TGTextState();
}

class _TGTextState extends State<TGText> {
  Widget _getTextWidgetByType() {
    Widget textWidget = TextField(
      controller: widget.text,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.2),
          fontSize: 14,
        ),
      ),
    );
    if (widget.type == 'select') {
      textWidget = ListTile(
        title: Text(
          widget.selectStr ?? '',
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: () {
          widget.onClick?.call();
        },
      );
    }
    return textWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TGTextPrefix(text: "${widget.prefixText}：", isNotNull: widget.isNotNull),
        ),
        Expanded(
          flex: 3,
          child: _getTextWidgetByType(),
        )
      ],
    );
  }
}
