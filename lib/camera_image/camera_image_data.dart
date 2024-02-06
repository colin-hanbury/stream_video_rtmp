import 'package:flutter/foundation.dart';
import 'package:stream_video_rtmp/camera_image/camera_image_format.dart';
import 'package:stream_video_rtmp/camera_image/camera_image_plane.dart';

/// A single complete image buffer from the platform camera.
///
/// This class allows for direct application access to the pixel data of an
/// Image through one or more [Uint8List]. Each buffer is encapsulated in a
/// [CameraImagePlane] that describes the layout of the pixel data in that
/// plane. [CameraImageData] is not directly usable as a UI resource.
///
/// Although not all image formats are planar on all platforms, this class
/// treats 1-dimensional images as single planar images.
@immutable
class CameraImageData {
  /// Creates a new instance with the given format, planes, and metadata.
  const CameraImageData({
    required this.format,
    required this.planes,
    required this.height,
    required this.width,
    this.lensAperture,
    this.sensorExposureTime,
    this.sensorSensitivity,
  });

  /// Format of the image provided.
  ///
  /// Determines the number of planes needed to represent the image, and
  /// the general layout of the pixel data in each [Uint8List].
  final CameraImageFormat format;

  /// Height of the image in pixels.
  ///
  /// For formats where some color channels are subsampled, this is the height
  /// of the largest-resolution plane.
  final int height;

  /// Width of the image in pixels.
  ///
  /// For formats where some color channels are subsampled, this is the width
  /// of the largest-resolution plane.
  final int width;

  /// The pixels planes for this image.
  ///
  /// The number of planes is determined by the format of the image.
  final List<CameraImagePlane> planes;

  /// The aperture settings for this image.
  ///
  /// Represented as an f-stop value.
  final double? lensAperture;

  /// The sensor exposure time for this image in nanoseconds.
  final int? sensorExposureTime;

  /// The sensor sensitivity in standard ISO arithmetic units.
  final double? sensorSensitivity;
}
