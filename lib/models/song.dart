import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable(includeIfNull: false)
class Song {
  Song({
    required this.id,
    required this.title,
    required this.filePath,
    required this.author,
    required this.price,
    this.isEnabled = false,
    this.midiData,
    required this.albumId,
    required this.musicGenreId,
    this.inAppPrice,
    this.priceInDollars,
  });

  final String title;
  final String author;
  @JsonKey(name: 'id')
  final String id;
  final double price;
  final String? inAppPrice;
  final double? priceInDollars;

  final String filePath;
  bool isEnabled;
  final String musicGenreId;

  final String albumId;
  List<int>? midiData;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'price': price,
      'priceInDollars': priceInDollars,
      'isEnabled': isEnabled ? 1 : 0,
      'musicGenreId': musicGenreId,
      'albumId': albumId,
      'midiData': midiData,
      'inAppPrice': inAppPrice,
    };
  }
}
