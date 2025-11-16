// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'] as String,
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      artistName: json['artistName'] as String,
      imagePath: json['imagePath'] as String,
      price: (json['price'] as num).toDouble(),
      musicGenreId: json['musicGenreId'] as String,
      priceInDollars: (json['priceInDollars'] as num?)?.toDouble() ?? 4.99,
      inAppPrice: json['inAppPrice'] as String? ?? '5000 Ar',
      subscriptionId: json['subscriptionId'] as String?,
      folderPath: json['folderPath'] as String?,
      isEnabled: json['isEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('songs', instance.songs);
  val['musicGenreId'] = instance.musicGenreId;
  writeNotNull('folderPath', instance.folderPath);
  writeNotNull('subscriptionId', instance.subscriptionId);
  writeNotNull('inAppPrice', instance.inAppPrice);
  writeNotNull('title', instance.title);
  val['artistName'] = instance.artistName;
  val['imagePath'] = instance.imagePath;
  val['isEnabled'] = instance.isEnabled;
  val['price'] = instance.price;
  val['priceInDollars'] = instance.priceInDollars;
  return val;
}
