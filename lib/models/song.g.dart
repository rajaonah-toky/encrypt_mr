// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      id: json['id'] as String,
      title: json['title'] as String,
      filePath: json['filePath'] as String,
      author: json['author'] as String,
      price: (json['price'] as num).toDouble(),
      isEnabled: json['isEnabled'] as bool? ?? false,
      midiData:
          (json['midiData'] as List<dynamic>?)?.map((e) => e as int).toList(),
      albumId: json['albumId'] as String,
      musicGenreId: json['musicGenreId'] as String,
      inAppPrice: json['inAppPrice'] as String?,
      priceInDollars: (json['priceInDollars'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SongToJson(Song instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'author': instance.author,
    'id': instance.id,
    'price': instance.price,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('inAppPrice', instance.inAppPrice);
  writeNotNull('priceInDollars', instance.priceInDollars);
  val['filePath'] = instance.filePath;
  val['isEnabled'] = instance.isEnabled;
  val['musicGenreId'] = instance.musicGenreId;
  val['albumId'] = instance.albumId;
  writeNotNull('midiData', instance.midiData);
  return val;
}
