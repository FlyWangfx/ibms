import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibms/utils/flutter_plugins/image_picker_util.dart';
import 'package:ibms/widgets/tg_ui/tg_bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class SXTip {

  static Future<List<XFile>> showBottomSheetForImage(BuildContext context,
      {bool isSingle = false, int quality = 100, bool hasGallery = true}) async {
    List<XFile> xFiles = [];
    List<TGBottomSheetButton> buttonList = [
      TGBottomSheetButton(
        text: '拍照',
        onPressed: () async {
          final XFile? xFile = await ImagePickerUtil.instance().pickImageFromCamera(
            imageQuality: quality,
          );
          if (xFile != null) xFiles.add(xFile);
          Navigator.pop<List<XFile>>(context, xFiles);
        },
      ),
    ];
    if (hasGallery) {
      buttonList.add(
        TGBottomSheetButton(
          text: '选择照片',
          onPressed: () async {
            if (Platform.isIOS) {
              // ios限制为选择一张照片,XR 机型选择多张会有 bug
              final XFile? xFile = await ImagePickerUtil.instance().pickImageFromGallery();
              if (xFile != null) xFiles.add(xFile);
            } else {
              if (isSingle) {
                final XFile? xFile = await ImagePickerUtil.instance().pickImageFromGallery(
                  imageQuality: quality,
                );
                if (xFile != null) xFiles.add(xFile);
              } else {
                final List<XFile>? images = await ImagePickerUtil.instance().pickMultiImage(
                  imageQuality: quality,
                );
                if (images != null) xFiles = images;
              }
            }
            Navigator.pop<List<XFile>>(context, xFiles);
          },
        ),
      );
    }
    await showTGModelBottomSheet<List<XFile>>(
      context: context,
      buttons: buttonList,
    );
    return xFiles;
  }

}
