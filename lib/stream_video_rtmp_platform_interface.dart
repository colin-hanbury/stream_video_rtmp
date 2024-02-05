import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'stream_video_rtmp_method_channel.dart';

abstract class StreamVideoRtmpPlatform extends PlatformInterface {
  /// Constructs a StreamVideoRtmpPlatform.
  StreamVideoRtmpPlatform() : super(token: _token);

  static final Object _token = Object();

  static StreamVideoRtmpPlatform _instance = MethodChannelStreamVideoRtmp();

  /// The default instance of [StreamVideoRtmpPlatform] to use.
  ///
  /// Defaults to [MethodChannelStreamVideoRtmp].
  static StreamVideoRtmpPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StreamVideoRtmpPlatform] when
  /// they register themselves.
  static set instance(StreamVideoRtmpPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
