// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  message: json['message'] as String,
  isUser: json['isUser'] as bool,
  time: DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'isUser': instance.isUser,
      'time': instance.time.toIso8601String(),
    };
