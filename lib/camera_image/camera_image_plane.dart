import 'package:flutter/foundation.dart';

/// A single color plane of image data.
///
/// The number and meaning of the planes in an image are determined by its
/// format.
@immutable
class CameraImagePlane {
  /// Creates a new instance with the given bytes and optional metadata.
  const CameraImagePlane({
    required this.bytes,
    required this.bytesPerRow,
    this.bytesPerPixel,
    this.height,
    this.width,
  });

  /// Bytes representing this plane.
  final Uint8List bytes;

  /// The row stride for this color plane, in bytes.
  final int bytesPerRow;

  /// The distance between adjacent pixel samples in bytes, when available.
  final int? bytesPerPixel;

  /// Height of the pixel buffer, when available.
  final int? height;

  /// Width of the pixel buffer, when available.
  final int? width;
}
