import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:stream_video_rtmp/camera_description.dart';

class CameraValue {
  /// True after [CameraController.initialize] has completed successfully.
  final bool isInitialized;

  /// True when a picture capture request has been sent but as not yet returned.
  final bool isTakingPicture;

  /// True when the camera is recording (not the same as previewing).
  final bool isRecordingVideo;

  /// True when images from the camera are being streamed.
  final bool isStreamingImages;

  final bool _isRecordingPaused;

  /// True when the preview widget has been paused manually.
  final bool isPreviewPaused;

  /// Set to the orientation the preview was paused in, if it is currently paused.
  final DeviceOrientation? previewPauseOrientation;

  /// True when camera [isRecordingVideo] and recording is paused.
  bool get isRecordingPaused => isRecordingVideo && _isRecordingPaused;

  /// Description of an error state.
  ///
  /// This is null while the controller is not in an error state.
  /// When [hasError] is true this contains the error description.
  final String? errorDescription;

  /// The size of the preview in pixels.
  ///
  /// Is `null` until [isInitialized] is `true`.
  final Size? previewSize;

  /// Convenience getter for `previewSize.width / previewSize.height`.
  ///
  /// Can only be called when [initialize] is done.
  double get aspectRatio => previewSize!.width / previewSize!.height;

  /// Whether the controller is in an error state.
  ///
  /// When true [errorDescription] describes the error.
  bool get hasError => errorDescription != null;

  /// The flash mode the camera is currently set to.
  final FlashMode flashMode;

  /// The exposure mode the camera is currently set to.
  final ExposureMode exposureMode;

  /// The focus mode the camera is currently set to.
  final FocusMode focusMode;

  /// Whether setting the exposure point is supported.
  final bool exposurePointSupported;

  /// Whether setting the focus point is supported.
  final bool focusPointSupported;

  /// The current device UI orientation.
  final DeviceOrientation deviceOrientation;

  /// The currently locked capture orientation.
  final DeviceOrientation? lockedCaptureOrientation;

  /// Whether the capture orientation is currently locked.
  bool get isCaptureOrientationLocked => lockedCaptureOrientation != null;

  /// The orientation of the currently running video recording.
  final DeviceOrientation? recordingOrientation;

  /// The properties of the camera device controlled by this controller.
  final CameraDescription description;

  const CameraValue({
    required this.isInitialized,
    this.errorDescription,
    this.previewSize,
    required this.isRecordingVideo,
    required this.isTakingPicture,
    required this.isStreamingImages,
    required bool isRecordingPaused,
    required this.flashMode,
    required this.exposureMode,
    required this.focusMode,
    required this.exposurePointSupported,
    required this.focusPointSupported,
    required this.deviceOrientation,
    required this.description,
    this.lockedCaptureOrientation,
    this.recordingOrientation,
    this.isPreviewPaused = false,
    this.previewPauseOrientation,
  }) : _isRecordingPaused = isRecordingPaused;

  /// Creates a new camera controller state for an uninitialized controller.
  const CameraValue.uninitialized(CameraDescription description)
      : this(
          isInitialized: false,
          isRecordingVideo: false,
          isTakingPicture: false,
          isStreamingImages: false,
          isRecordingPaused: false,
          flashMode: FlashMode.auto,
          exposureMode: ExposureMode.auto,
          exposurePointSupported: false,
          focusMode: FocusMode.auto,
          focusPointSupported: false,
          deviceOrientation: DeviceOrientation.portraitUp,
          isPreviewPaused: false,
          description: description,
        );

  /// Creates a modified copy of the object.
  ///
  /// Explicitly specified fields get the specified value, all other fields get
  /// the same value of the current object.
  CameraValue copyWith({
    bool? isInitialized,
    bool? isRecordingVideo,
    bool? isTakingPicture,
    bool? isStreamingImages,
    String? errorDescription,
    Size? previewSize,
    bool? isRecordingPaused,
    FlashMode? flashMode,
    ExposureMode? exposureMode,
    FocusMode? focusMode,
    bool? exposurePointSupported,
    bool? focusPointSupported,
    DeviceOrientation? deviceOrientation,
    Optional<DeviceOrientation>? lockedCaptureOrientation,
    Optional<DeviceOrientation>? recordingOrientation,
    bool? isPreviewPaused,
    CameraDescription? description,
    Optional<DeviceOrientation>? previewPauseOrientation,
  }) {
    return CameraValue(
      isInitialized: isInitialized ?? this.isInitialized,
      errorDescription: errorDescription,
      previewSize: previewSize ?? this.previewSize,
      isRecordingVideo: isRecordingVideo ?? this.isRecordingVideo,
      isTakingPicture: isTakingPicture ?? this.isTakingPicture,
      isStreamingImages: isStreamingImages ?? this.isStreamingImages,
      isRecordingPaused: isRecordingPaused ?? _isRecordingPaused,
      flashMode: flashMode ?? this.flashMode,
      exposureMode: exposureMode ?? this.exposureMode,
      focusMode: focusMode ?? this.focusMode,
      exposurePointSupported:
          exposurePointSupported ?? this.exposurePointSupported,
      focusPointSupported: focusPointSupported ?? this.focusPointSupported,
      deviceOrientation: deviceOrientation ?? this.deviceOrientation,
      lockedCaptureOrientation: lockedCaptureOrientation == null
          ? this.lockedCaptureOrientation
          : lockedCaptureOrientation.orNull,
      recordingOrientation: recordingOrientation == null
          ? this.recordingOrientation
          : recordingOrientation.orNull,
      isPreviewPaused: isPreviewPaused ?? this.isPreviewPaused,
      description: description ?? this.description,
      previewPauseOrientation: previewPauseOrientation == null
          ? this.previewPauseOrientation
          : previewPauseOrientation.orNull,
    );
  }

  @override
  String toString() {
    return '${objectRuntimeType(this, 'CameraValue')}('
        'isRecordingVideo: $isRecordingVideo, '
        'isInitialized: $isInitialized, '
        'errorDescription: $errorDescription, '
        'previewSize: $previewSize, '
        'isStreamingImages: $isStreamingImages, '
        'flashMode: $flashMode, '
        'exposureMode: $exposureMode, '
        'focusMode: $focusMode, '
        'exposurePointSupported: $exposurePointSupported, '
        'focusPointSupported: $focusPointSupported, '
        'deviceOrientation: $deviceOrientation, '
        'lockedCaptureOrientation: $lockedCaptureOrientation, '
        'recordingOrientation: $recordingOrientation, '
        'isPreviewPaused: $isPreviewPaused, '
        'previewPausedOrientation: $previewPauseOrientation, '
        'description: $description)';
  }
}
