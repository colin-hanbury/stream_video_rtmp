import 'package:flutter/foundation.dart';
import 'package:stream_video_rtmp/image_format_group.dart';

/// Describes how pixels are represented in an image.
@immutable
class CameraImageFormat {
  /// Create a new format with the given cross-platform group and raw underyling
  /// platform identifier.
  const CameraImageFormat(this.group, {required this.raw});

  /// Describes the format group the raw image format falls into.
  final ImageFormatGroup group;

  /// Raw version of the format from the underlying platform.
  ///
  /// On Android, this should be an `int` from class
  /// `android.graphics.ImageFormat`. See
  /// https://developer.android.com/reference/android/graphics/ImageFormat
  ///
  /// On iOS, this should be a `FourCharCode` constant from Pixel Format
  /// Identifiers. See
  /// https://developer.apple.com/documentation/corevideo/1563591-pixel_format_identifiers
  final dynamic raw;
}
