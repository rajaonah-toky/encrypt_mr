// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicGenre _$MusicGenreFromJson(Map<String, dynamic> json) => MusicGenre(
      id: json['id'] as String?,
      priority: json['priority'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$MusicGenreToJson(MusicGenre instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['priority'] = instance.priority;
  val['label'] = instance.label;
  return val;
}
