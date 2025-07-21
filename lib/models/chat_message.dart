import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_message.freezed.dart';
part 'chat_message.g.dart';


@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String message,
    required bool isUser,
    required DateTime time,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String,dynamic> json) => _$ChatMessageFromJson(json);

}