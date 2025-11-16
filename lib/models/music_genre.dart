import 'package:json_annotation/json_annotation.dart';
part 'music_genre.g.dart';

@JsonSerializable(includeIfNull: false)
class MusicGenre {
  MusicGenre({this.id, required this.priority, required this.label});
  String? id;
  int priority;
  String label;

  factory MusicGenre.fromJson(Map<String, dynamic> json) =>
      _$MusicGenreFromJson(json);
  Map<String, dynamic> toJson() => _$MusicGenreToJson(this);
}
