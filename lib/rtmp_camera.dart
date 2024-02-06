import 'package:stream_video_rtmp/rtmp_camera_platform.dart';

class StreamVideoRtmp {
  Future<String?> getPlatformVersion() {
    return RtmpCameraPlatform.instance.getPlatformVersion();
  }
}
