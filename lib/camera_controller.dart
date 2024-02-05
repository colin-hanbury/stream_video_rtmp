import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_video_rtmp/camera_description.dart';
import 'package:stream_video_rtmp/camera_value.dart';


class CamaraController extends ValueNotifier<CameraValue> {

  /// The properties of the camera device controlled by this controller.
  CameraDescription get description => value.description;

  /// The resolution this controller is targeting.
  ///
  /// This resolution preset is not guaranteed to be available on the device,
  /// if unavailable a lower resolution will be used.
  ///
  /// See also: [ResolutionPreset].
  final ResolutionPreset resolutionPreset;

  /// Whether to include audio when recording a video.
  final bool enableAudio;

  /// The [ImageFormatGroup] describes the output of the raw image format.
  ///
  /// When null the imageFormat will fallback to the platforms default.
  final ImageFormatGroup? imageFormatGroup;


  CameraController(
    CameraDescription description,
    this.resolutionPreset,
    this.enableAudio,
    this.imageFormatGroup,
      ) : super(CameraValue.uninitialized(description));
}
