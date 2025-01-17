part of models;

/// Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation.
class InlineQueryResultGif extends InlineQueryResult {
  @override
  InlineQueryResultType get type => InlineQueryResultType.gif;

  /// A valid URL for the GIF file. File size must not exceed 1MB
  String gifUrl;

  /// Optional. Width of the GIF
  int? gifWidth;

  /// Optional. Height of the GIF
  int? gifHeight;

  /// Optional. Duration of the GIF in seconds
  int? gifDuration;

  /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result
  String thumbUrl;

  /// Optional. MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”, or “video/mp4”. Defaults to “image/jpeg”
  String? thumbMimeType;

  /// Optional. Title for the result
  String? title;

  /// Optional. Caption of the GIF file to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Optional. Mode for parsing entities in the caption. See formatting options for more details.
  ParseMode? parseMode;

  /// Optional. List of special entities that appear in the caption, which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional. Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional. Content of the message to be sent instead of the GIF animation
  InputMessageContent? inputMessageContent;

  InlineQueryResultGif({
    required this.gifUrl,
    required this.thumbUrl,
    required String id,
    this.gifWidth,
    this.gifHeight,
    this.gifDuration,
    this.thumbMimeType,
    this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'gif_url': gifUrl,
      'gif_width': gifWidth,
      'gif_height': gifHeight,
      'gif_duration': gifDuration,
      'thumb_url': thumbUrl,
      'thumb_mime_type': thumbMimeType,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((key, value) => value == null);
  }

  factory InlineQueryResultGif.fromJson(Map<String, dynamic> json) {
    return InlineQueryResultGif(
      gifUrl: json['gif_url'],
      thumbUrl: json['thumb_url'],
      id: json['id'],
      gifWidth: json['gif_width'],
      gifHeight: json['gif_height'],
      gifDuration: json['gif_duration'],
      thumbMimeType: json['thumb_mime_type'],
      title: json['title'],
      caption: json['caption'],
      parseMode: json['parse_mode'] != null
          ? ParseMode.fromJson(json['parse_mode'])
          : null,
      captionEntities: json['caption_entities'] != null
          ? (json['caption_entities'] as List)
              .map((e) => MessageEntity.fromJson(e))
              .toList()
          : null,
      replyMarkup: json['reply_markup'] != null
          ? InlineKeyboardMarkup.fromJson(json['reply_markup'])
          : null,
      inputMessageContent: json['input_message_content'] != null
          ? InputMessageContent.fromJson(json['input_message_content'])
          : null,
    );
  }
}
