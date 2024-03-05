import 'package:be_widgets/be_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class EasyDialog {
  static bool show = false;

  static void showAlert({
    final bool autoDismiss = true,
    final String? title,
    final TextAlign? titleAlign,
    final Widget? content,
    final String? subtitle,
    final String? message,
    final String? error,
    final bool showCancelButton = false,
    final VoidCallback? onPressedCancel,
    final VoidCallback? onPressedConfirm,
  }) {
    if (show) return;
    show = true;
    BotToast.showAnimationWidget(
      animationDuration: const Duration(milliseconds: 300),
      toastBuilder: (CancelFunc cancelFunc) {
        return Stack(
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(color: Colors.black54),
              child: SizedBox.expand(),
            ),
            Center(
              child: BEAlertDialog(
                title: title ?? '温馨提示',
                content: content ??
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (subtitle != null)
                          Text(
                            subtitle,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        if (message != null)
                          Text(
                            message,
                            style: TextStyle(fontSize: 14),
                          ),
                        if (error != null)
                          Text(
                            error,
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                      ],
                    ),
                onPressedCancel: showCancelButton
                    ? () {
                        if (autoDismiss) {
                          cancelFunc();
                          show = false;
                        }
                        if (onPressedCancel != null) onPressedCancel();
                      }
                    : null,
                onPressedOk: () {
                  if (autoDismiss) {
                    cancelFunc();
                    show = false;
                  }
                  if (onPressedConfirm != null) onPressedConfirm();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
