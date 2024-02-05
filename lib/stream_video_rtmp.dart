
import 'stream_video_rtmp_platform_interface.dart';

class StreamVideoRtmp {
  Future<String?> getPlatformVersion() {
    return StreamVideoRtmpPlatform.instance.getPlatformVersion();
  }
}
