import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'dart:async';

import 'package:path/path.dart';

import '../models/album.dart';
import '../models/music_genre.dart';
import '../models/song.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var path = await initDeleteDb('mickram.db');
    return await openDatabase(
      path,
      password: 'U2FGLTJWRC1AIw==',
      version: 9,
      onCreate: _createDatabase,
    );
  }

  /// delete the db, create the folder and returnes its path
  Future<String> initDeleteDb(String dbName) async {
    final databasePath = await getDatabasesPath();
    // debugPrint(databasePath);
    final path = join(databasePath, dbName);

    // make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        debugPrint('e:$e');
      }
    }
    return path;
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE music_genres(
        id TEXT,
        priority INTEGER,
        label TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE albums(
        id TEXT,
        folderPath TEXT,
        subscriptionId TEXT,
        title TEXT,
        artistName TEXT,
        imagePath TEXT,
        isEnabled INTEGER,
        price REAL,
        priceInDollars REAL,
        inAppPrice TEXT,
        musicGenreId TEXT,
        FOREIGN KEY(musicGenreId) REFERENCES music_genres(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE songs(
      id TEXT,
      title TEXT,
      author TEXT,
      price REAL,
      priceInDollars REAL,
      filePath TEXT,
      isEnabled INTEGER,
      musicGenreId TEXT,
      albumId TEXT,
      midiData BLOB,
      inAppPrice TEXT,
      imagePath TEXT,
      hasMp3 INTEGER,
      mp3FilePath TEXT,
      mp3Offset INTEGER,
      FOREIGN KEY(musicGenreId) REFERENCES music_genres(id),
      FOREIGN KEY(albumId) REFERENCES albums(id)
    )
    ''');
  }

  Future<int> insertAlbum(Album album) async {
    Database db = await instance.database;
    int albumId = await db.insert('albums', album.toMap());
    // if (album.songs != null) {
    //   for (Song song in album.songs!) {
    //     song.albumId = album.id;
    //     await insertSong(song);
    //   }
    // }
    return albumId;
  }

  Future<int> insertSong(Song song) async {
    Database db = await instance.database;
    return await db.insert('songs', song.toMap());
  }

  Future<int> insertMusicGenre(MusicGenre genre) async {
    Database db = await instance.database;
    return await db.insert('music_genres', genre.toJson());
  }

  Future<List<Album>> getAlbums() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> albumMaps = await db.query('albums');
    List<Album> albums = List.generate(albumMaps.length, (index) {
      return Album.fromJson(albumMaps[index]);
    });

    for (Album album in albums) {
      List<Map<String, dynamic>> songMaps = await db.query(
        'songs',
        where: 'albumId = ?',
        whereArgs: [album.id],
      );
      album.songs = List.generate(songMaps.length, (index) {
        return Song.fromJson(songMaps[index]);
      });

      Map<String, dynamic>? genreMap = await db
          .query(
            'music_genres',
            where: 'id = ?',
            whereArgs: [album.musicGenreId],
            limit: 1,
          )
          .then(
            (List<Map<String, dynamic>> value) =>
                value.isNotEmpty ? value.first : null,
          );

      if (genreMap != null) {
        //album.musicGenre = MusicGenre.fromJson(genreMap);
      }
    }

    return albums;
  }

  Future<List<Song>> getSongs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> songMaps = await db.query('songs');
    List<Song> songs = List.generate(songMaps.length, (index) {
      return Song.fromJson(songMaps[index]);
    });

    for (Song song in songs) {
      Map<String, dynamic>? genreMap = await db
          .query(
            'music_genres',
            where: 'id = ?',
            whereArgs: [song.musicGenreId],
            limit: 1,
          )
          .then(
            (List<Map<String, dynamic>> value) =>
                value.isNotEmpty ? value.first : null,
          );

      if (genreMap != null) {
        //song.musicGenre = MusicGenre.fromJson(genreMap);
      }
    }

    return songs;
  }

  /// Get database path information for debugging
  static Future<String> getDatabaseInfo() async {
    try {
      final databasePath = await getDatabasesPath();
      final fullPath = join(databasePath, 'mickram.db');

      String info = 'Database path: $fullPath\n';
      info += 'Database directory: $databasePath\n';

      // Check if database file exists
      final dbFile = File(fullPath);
      info += 'Database exists: ${await dbFile.exists()}\n';

      if (await dbFile.exists()) {
        final stat = await dbFile.stat();
        info += 'Database size: ${stat.size} bytes\n';
        info += 'Last modified: ${stat.modified}\n';
      }

      // Check if directory exists
      final dir = Directory(databasePath);
      info += 'Directory exists: ${await dir.exists()}';

      return info;
    } catch (e) {
      return 'Error getting database info: $e';
    }
  }

  Future<List<MusicGenre>> getMusicGenres() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> genreMaps = await db.query('music_genres');
    return List.generate(genreMaps.length, (index) {
      return MusicGenre.fromJson(genreMaps[index]);
    });
  }
}
