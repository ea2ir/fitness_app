import 'dart:io';

import 'package:fitnessapp/models/languages.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  //Singleton Pattern
  DbHelper._();

  static final _ourInstance = new DbHelper._();

  static DbHelper getInstance() {
    return _ourInstance;
  }

  static Database _dbExist;
  static const String _TBL_LANGUAGES = "languages";

  Future<Database> get db async {
    if (_dbExist != null) {
      print('Database Already Exists.');
      return _dbExist;
    } else {
      _dbExist = await initDB();
      return _dbExist;
    }
  }

  Future pathDB() async {
    final _dbPath = await getDatabasesPath();
    final _path = join(_dbPath, 'assets', 'db', 'main_database.db');
    return _path;
  }

  Future initDB() async {
    final _path = await pathDB();
    final _exist = await databaseExists(_path);
    if (!_exist) {
      print('Create Copy Of Database.');
      try {
        await Directory(dirname(_path)).create(recursive: true);
      } catch (_) {}
      ByteData _data =
          await rootBundle.load(join('assets', 'db', 'main_database.db'));
      List<int> _byte =
          _data.buffer.asUint8List(_data.offsetInBytes, _data.lengthInBytes);
      await File(_path).writeAsBytes(_byte, flush: true);
    }
  }

  Future get openDB async {
    final _path = await pathDB();
    print('Database is Open.');
    return _dbExist = await openDatabase(_path);
  }

  Future get closeDB async {
    print('Database is Close.');
    return _dbExist.close;
  }

  Future<List<Languages>> getLanguageData() async {
    var dbClient = await _dbExist;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $_TBL_LANGUAGES");
    List<Languages> languages = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; ++i) {
        languages.add(Languages.fromMap(maps[i]));
      }
    }
    return languages;
  }
}
