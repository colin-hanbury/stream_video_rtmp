import 'package:stream_video_rtmp/camera_image/camera_image_data.dart';
import 'package:stream_video_rtmp/camera_image/camera_image_plane.dart';
import 'package:stream_video_rtmp/image_format.dart';
import 'package:stream_video_rtmp/plane.dart';

/// A single complete image buffer from the platform camera.
///
/// This class allows for direct application access to the pixel data of an
/// Image through one or more [Uint8List]. Each buffer is encapsulated in a
/// [Plane] that describes the layout of the pixel data in that plane. The
/// [CameraImage] is not directly usable as a UI resource.
///
/// Although not all image formats are planar on iOS, we treat 1-dimensional
/// images as single planar images.
class CameraImage {
  /// Creates a [CameraImage] from the platform interface version.
  CameraImage.fromPlatformInterface(CameraImageData data)
      : format = ImageFormat.fromPlatformInterface(data.format),
        height = data.height,
        width = data.width,
        planes = List<Plane>.unmodifiable(data.planes.map<Plane>(
            (CameraImagePlane plane) => Plane.fromPlatformInterface(plane))),
        lensAperture = data.lensAperture,
        sensorExposureTime = data.sensorExposureTime,
        sensorSensitivity = data.sensorSensitivity;

  /// Creates a [CameraImage] from method channel data.
  @Deprecated('Use fromPlatformInterface instead')
  CameraImage.fromPlatformData(Map<dynamic, dynamic> data)
      : format = ImageFormat.fromPlatformData(data['format']),
        height = data['height'] as int,
        width = data['width'] as int,
        lensAperture = data['lensAperture'] as double?,
        sensorExposureTime = data['sensorExposureTime'] as int?,
        sensorSensitivity = data['sensorSensitivity'] as double?,
        planes = List<Plane>.unmodifiable((data['planes'] as List<dynamic>)
            .map<Plane>((dynamic planeData) =>
                Plane.fromPlatformData(planeData as Map<dynamic, dynamic>)));

  /// Format of the image provided.
  ///
  /// Determines the number of planes needed to represent the image, and
  /// the general layout of the pixel data in each [Uint8List].
  final ImageFormat format;

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
  final List<Plane> planes;

  /// The aperture settings for this image.
  ///
  /// Represented as an f-stop value.
  final double? lensAperture;

  /// The sensor exposure time for this image in nanoseconds.
  final int? sensorExposureTime;

  /// The sensor sensitivity in standard ISO arithmetic units.
  final double? sensorSensitivity;
}
