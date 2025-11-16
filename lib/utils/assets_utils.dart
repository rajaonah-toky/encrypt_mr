import 'dart:convert';
import 'package:encrypt_mc/models/music_genre.dart';
import 'package:flutter/services.dart';

import '../models/album.dart';
import '../models/song.dart';

class AssetFetcher {
  static Future<List<Song>> loadSongsFromAlbumId(String albumId) async {
    List<Song> songs = [];

    String data = await rootBundle.loadString('assets/songs.json');
    List<dynamic> jsonData = json.decode(data);

    for (var json in jsonData) {
      Song song = Song.fromJson(json);
      if (song.albumId == albumId) {
        songs.add(song);
      }
    }

    return songs;
  }

  static Future<List<Album>> loadAlbums() async {
    List<Album> albums = [];
    String data = await rootBundle.loadString('assets/albums.json');
    List<dynamic> jsonData = json.decode(data);

    for (var json in jsonData) {
      Album album = Album.fromJson(json);

      List<Song> allSongs = await AssetFetcher.loadSongsFromAlbumId(album.id);
      album.songs = allSongs;
      albums.add(album);
    }

    return albums;
  }

  static Future<List<Song>> loadSongs() async {
    List<Song> songs = [];
    String data = await rootBundle.loadString('assets/songs.json');
    List<dynamic> jsonData = json.decode(data);

    for (var json in jsonData) {
      Song song = Song.fromJson(json);

      ByteData byteData = await rootBundle.load(song.filePath);
      List<int> midiData = byteData.buffer.asUint8List();
      song.midiData = midiData;

      songs.add(song);
    }

    return songs;
  }

  static Future<List<MusicGenre>> loadMusicGenres() async {
    List<MusicGenre> musicGenres = [];
    String data = await rootBundle.loadString('assets/music_genres.json');
    List<dynamic> jsonData = json.decode(data);

    for (var json in jsonData) {
      MusicGenre musicGenre = MusicGenre.fromJson(json);
      musicGenres.add(musicGenre);
    }
    return musicGenres;
  }
}
