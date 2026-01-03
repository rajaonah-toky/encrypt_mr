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
    required this.imagePath,
    this.hasMp3 = false,
    this.mp3FilePath,
    this.mp3Offset = 0,
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
  final String imagePath;
  List<int>? midiData;
  final bool hasMp3;
  final String? mp3FilePath;
  final int mp3Offset;

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
      'imagePath': imagePath,
      'hasMp3': hasMp3 ? 1 : 0,
      'mp3FilePath': mp3FilePath,
      'mp3Offset': mp3Offset,
    };
  }
}
