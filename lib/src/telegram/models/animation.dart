part of models;

/// This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound).
class Animation {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Video width as defined by sender
  int width;

  /// Video height as defined by sender
  int height;

  /// Duration of the video in seconds as defined by sender
  ///
  /// A handy [Duration] getter is available as [durationTime]
  int duration;

  /// Optional. Animation thumbnail as defined by sender
  PhotoSize? thumb;

  /// Optional. Original animation filename as defined by sender
  String? fileName;

  /// Optional. MIME type of the file as defined by sender
  String? mimeType;

  /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
  int? fileSize;

  Animation({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    required this.duration,
    this.thumb,
    this.fileName,
    this.mimeType,
    this.fileSize,
  });

  factory Animation.fromJson(Map<String, dynamic> json) {
    return Animation(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      width: json['width']!,
      height: json['height']!,
      duration: json['duration']!,
      thumb: json['thumb'] != null ? PhotoSize.fromJson(json['thumb']!) : null,
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'width': width,
      'height': height,
      'duration': duration,
      'thumb': thumb?.toJson(),
      'file_name': fileName,
      'mime_type': mimeType,
      'file_size': fileSize,
    }..removeWhere((key, value) => value == null);
  }

  /// Duration of the video as [Duration] object.
  Duration get durationTime => Duration(seconds: duration);
}
