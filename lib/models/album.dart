import 'song.dart';
import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable(includeIfNull: false)
class Album {
  Album({
    required this.id,
    this.songs,
    this.title,
    required this.artistName,
    required this.imagePath,
    required this.price,
    required this.musicGenreId,
    this.priceInDollars = 4.99,
    this.inAppPrice = '5000 Ar',
    this.subscriptionId,
    this.folderPath,
    this.isEnabled = false,
  });

  final String id;
  List<Song>? songs;
  final String musicGenreId;
  final String? folderPath;
  String? subscriptionId;
  String? inAppPrice;
  final String? title;
  final String artistName;
  final String imagePath;
  bool isEnabled;
  final double price;
  final double priceInDollars;
  // MusicGenre musicGenre;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'folderPath': folderPath,
      'subscriptionId': subscriptionId,
      'title': title,
      'artistName': artistName,
      'imagePath': imagePath,
      'price': price,
      'priceInDollars': priceInDollars,
      'inAppPrice': inAppPrice,
      'musicGenreId': musicGenreId,
    };
  }
}
