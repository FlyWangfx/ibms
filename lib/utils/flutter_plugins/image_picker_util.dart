import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  /// 单例
  ImagePickerUtil._() {
    _picker = ImagePicker();
  }

  static final ImagePickerUtil _instance = ImagePickerUtil._();

  factory ImagePickerUtil.instance() => _instance;

  /// image_picker
  late ImagePicker _picker;

  /// 私有方法
  Future<XFile?> _pickImage({
    required ImageSource source,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) {
    return _picker.pickImage(
      source: source,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
  }

  Future<XFile?> _pickVideo({
    required ImageSource source,
    Duration? maxDuration,
  }) {
    return _picker.pickVideo(
      source: source,
      maxDuration: maxDuration,
    );
  }

  /// 提供外部使用方法
  Future<List<XFile>?> pickMultiImage({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) {
    return _picker.pickMultiImage(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
  }

  /// 从照片选择图片
  Future<XFile?> pickImageFromGallery({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) {
    return _pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
  }

  /// 拍照
  Future<XFile?> pickImageFromCamera({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) {
    return _pickImage(
      source: ImageSource.camera,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );
  }

  /// 从照片选择视频
  Future<XFile?> pickVideoFromGallery({
    Duration? maxDuration,
  }) {
    return _pickVideo(
      source: ImageSource.gallery,
      maxDuration: maxDuration,
    );
  }

  /// 摄像
  Future<XFile?> pickVideoFromCamera({
    Duration? maxDuration,
  }) {
    return _pickVideo(
      source: ImageSource.camera,
      maxDuration: maxDuration,
    );
  }
}
