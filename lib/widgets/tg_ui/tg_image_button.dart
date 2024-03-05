import 'package:flutter/material.dart';

class TGImageButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  // 图片与文字间隔
  final double space;

  // 以下是图片配置
  final ImageProvider? image;
  final double imageWidth;
  final double imageHeight;

  // 以下是文本配置
  final String? text;
  final TextStyle? textStyle;

  const TGImageButton({
    Key? key,
    this.onPressed,
    this.width = 80,
    this.height = 80,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.space = 0,
    this.image,
    this.imageWidth = 36,
    this.imageHeight = 36,
    this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  State<TGImageButton> createState() => _TGImageButtonState();
}

class _TGImageButtonState extends State<TGImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.black.withOpacity(0.02),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: widget.image != null,
              child: Image(
                image: widget.image!,
                width: widget.imageWidth,
                height: widget.imageHeight,
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: widget.space,
            ),
            Visibility(
              visible: widget.text != null,
              child: Text(
                widget.text!,
                style: widget.textStyle ??
                    TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 14,
                    ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        widget.onPressed?.call();
      },
    );
  }
}
