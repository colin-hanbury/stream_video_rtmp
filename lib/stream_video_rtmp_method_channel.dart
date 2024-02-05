import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'stream_video_rtmp_platform_interface.dart';

/// An implementation of [StreamVideoRtmpPlatform] that uses method channels.
class MethodChannelStreamVideoRtmp extends StreamVideoRtmpPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('stream_video_rtmp');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
