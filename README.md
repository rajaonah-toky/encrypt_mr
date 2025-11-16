# encrypt_mc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


dart run build_runner build --delete-conflicting-outputs



test('Open asset database', () async {
      var databasesPath = await getDatabasesPath();
      var path = join(databasesPath, 'asset_example.db');

      // delete existing if any
      await deleteDatabase(path);

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      var data =
          await rootBundle.load(join('assets', 'example_pass_1234.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

      // open the database
      var db = await openDatabase(path, password: '1234');

      // Our database as a single table with a single element
      List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM Test');
      //debugPrint('list $list');
      expect(list.first['name'], 'simple value');

      await db.close();
    });



    external 
    https://github.com/tekartik/sqflite/blob/master/sqflite/doc/external.md


    data/data/com.example.encryp


