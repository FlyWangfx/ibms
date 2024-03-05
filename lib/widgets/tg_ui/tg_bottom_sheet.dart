import 'package:flutter/material.dart';

class TGBottomSheetButton {
  String text;
  Icon? icon;
  VoidCallback onPressed;

  TGBottomSheetButton({
    required this.text,
    this.icon,
    required this.onPressed,
  });
}

Future<T?> showTGModelBottomSheet<T>({
  required BuildContext context,
  required List<TGBottomSheetButton> buttons,
}) {
  assert(buttons.length > 0);
  return showModalBottomSheet<T>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 50.0 * (buttons.length + 1),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: buttons.length + 1,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 1,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            if (index < buttons.length) {
              TGBottomSheetButton button = buttons[index];
              return TextButton(
                  child: Text(button.text),
                  onPressed: () {
                    button.onPressed();
                  });
            } else {
              return TextButton(
                  child: Text(
                    '取消',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  });
            }
          },
        ),
      );
    },
  );
}
