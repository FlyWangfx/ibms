import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ibms/res/assets_res.dart';
import 'package:ibms/utils/other/routes.dart';
import 'package:ibms/utils/other/sx_tip.dart';
import 'package:ibms/widgets/tg_ui/tg_text_prefix.dart';
import 'package:image_picker/image_picker.dart';

typedef StepHeaderClickedCallback<int> = void Function(int index);

class ImageUpload extends StatefulWidget {
  final List<File> imgFileList;
  final int rightFlex;

  const ImageUpload({
    Key? key,
    required this.imgFileList,
    this.rightFlex = 4,
  }) : super(key: key);

  @override
  _ImageUpload createState() => _ImageUpload();
}

class _ImageUpload extends State<ImageUpload> {
  void _onClickChooseImage(state) async {
    final List<XFile> xFiles = await SXTip.showBottomSheetForImage(
      context,
      quality: 80,
      hasGallery: false,
    );
    if (xFiles.length > 0) {
      state(() {
        widget.imgFileList.addAll(xFiles.map((e) => File(e.path)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: TGTextPrefix(text: '上传图片：'),
            ),
            Expanded(
              flex: widget.rightFlex,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.imgFileList.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.0,
                ),
                itemBuilder: (context, index) {
                  if (index < widget.imgFileList.length) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                          width: 64,
                          margin: EdgeInsets.only(top: 1),
                          child: GestureDetector(
                            child: Image.file(
                              File(widget.imgFileList[index].path),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteSetting.PHOTO_ONLY_VIEW_PAGE_URL,
                                arguments: FileImage(
                                  File(widget.imgFileList[index].path),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: -1,
                          child: Container(
                            width: 16,
                            height: 16,
                            child: GestureDetector(
                              child: Image.asset(AssetsRes.CROSS),
                              onTap: () {
                                state(() {
                                  widget.imgFileList.remove(widget.imgFileList[index]);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      width: 64,
                      margin: EdgeInsets.only(top: 1),
                      child: TextButton(
                        child: Column(
                          children: [
                            Image.asset(AssetsRes.PLUS, scale: 8),
                            Expanded(
                              child: Text(
                                '拍照',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(221, 221, 221, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10, vertical: 11)),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          side: MaterialStateProperty.all(
                            BorderSide(color: Color.fromRGBO(229, 229, 229, 1), width: 1),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          _onClickChooseImage(state);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
