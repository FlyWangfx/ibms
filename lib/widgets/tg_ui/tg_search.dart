import 'package:flutter/material.dart';

typedef SearchClickedCallback<String> = void Function(String keyword);

class TGSearch extends StatefulWidget {
  final String hintText;
  final String trailingText;
  final SearchClickedCallback onClick;

  TGSearch({
    Key? key,
    required this.hintText,
    required this.trailingText,
    required this.onClick,
  }) : super(key: key);

  @override
  State<TGSearch> createState() => _TGSearchState();
}

class _TGSearchState extends State<TGSearch> {
  late final TextEditingController _keyword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: _keyword,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            size: 16,
            color: Colors.black.withOpacity(0.2),
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.2),
            fontSize: 14,
          ),
          hintText: widget.hintText,
        ),
      ),
      trailing: TextButton(
        child: Text(
          widget.trailingText,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        onPressed: () async {
          widget.onClick(_keyword.text);
        },
      ),
    );
  }
}
