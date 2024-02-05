import 'package:flutter_test/flutter_test.dart';
import 'package:stream_video_rtmp/stream_video_rtmp.dart';
import 'package:stream_video_rtmp/stream_video_rtmp_platform_interface.dart';
import 'package:stream_video_rtmp/stream_video_rtmp_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockStreamVideoRtmpPlatform
    with MockPlatformInterfaceMixin
    implements StreamVideoRtmpPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final StreamVideoRtmpPlatform initialPlatform = StreamVideoRtmpPlatform.instance;

  test('$MethodChannelStreamVideoRtmp is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStreamVideoRtmp>());
  });

  test('getPlatformVersion', () async {
    StreamVideoRtmp streamVideoRtmpPlugin = StreamVideoRtmp();
    MockStreamVideoRtmpPlatform fakePlatform = MockStreamVideoRtmpPlatform();
    StreamVideoRtmpPlatform.instance = fakePlatform;

    expect(await streamVideoRtmpPlugin.getPlatformVersion(), '42');
  });
}
