import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoOnlyViewPage extends StatelessWidget {
  final ImageProvider imageProvider;

  const PhotoOnlyViewPage({
    Key? key,
    required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: PhotoView(
        imageProvider: imageProvider,
      ),
    );
  }
}
