import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:stream_video_rtmp/camera_description.dart';

import 'stream_video_rtmp_method_channel.dart';

abstract class RtmpCameraPlatform extends PlatformInterface {
  /// Constructs a StreamVideoRtmpPlatform.
  RtmpCameraPlatform() : super(token: _token);

  static final Object _token = Object();

  static RtmpCameraPlatform _instance = MethodChannelRtmpCamera();

  /// The default instance of [RtmpCameraPlatform] to use.
  ///
  /// Defaults to [MethodChannelRtmpCamera].
  static RtmpCameraPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RtmpCameraPlatform] when
  /// they register themselves.
  static set instance(RtmpCameraPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Completes with a list of available cameras.
  ///
  /// This method returns an empty list when no cameras are available.
  Future<List<CameraDescription>> availableCameras() {
    throw UnimplementedError('availableCameras() is not implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
