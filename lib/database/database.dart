import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

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
