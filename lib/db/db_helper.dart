import 'dart:io';
import 'package:fitnessapp/models/categories.dart';
import 'package:fitnessapp/models/exercise_item.dart';
import 'package:fitnessapp/models/exercises.dart';
import 'package:fitnessapp/models/languages.dart';
import 'package:fitnessapp/models/settings.dart';
import 'package:fitnessapp/models/themes.dart';
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
  static const String _TBL_SETTINGS = "settings";
  static const String _TBL_CATEGORIES = "categories";
  static const String _TBL_THEMES = "themes";
  static const String _TBL_EXERCISES = "exercises";


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

  Future<List<Settings>> getSettingsData() async {
    var dbClient = await _dbExist;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $_TBL_SETTINGS");
    List<Settings> settings = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; ++i) {
        settings.add(Settings.fromMap(maps[i]));
      }
    }
    return settings;
  }
  Future<int> updateSettings(Settings setting) async {
    var dbClient = await _dbExist;
    return await dbClient.update(
      _TBL_SETTINGS,
      setting.toMap(),
      where: "id_setting = ?",
      whereArgs: [setting.id_setting],
    );
  }
  Future<List<Categories>> getCategoriesData(String _idLang) async {
    var dbClient = await _dbExist;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $_TBL_CATEGORIES WHERE id_lang=$_idLang");
    List<Categories> _categories = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; ++i) {
        _categories.add(Categories.fromMap(maps[i]));
      }
    }
    return _categories;
  }

  Future<List<Exercises>> getExercisesData(String _selectedExercisesId , String _selectedCatId) async {
    var dbClient = await _dbExist;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $_TBL_EXERCISES WHERE id_lang=$_selectedExercisesId AND id_cat=$_selectedCatId");
    List<Exercises> _exercises = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; ++i) {
        _exercises.add(Exercises.fromMap(maps[i]));
      }
    }
    return _exercises;
  }
  Future<List<ExerciseItem>> getExerciseItem(String _id_lang , String _selectedExerciseId) async {
    var dbClient = await _dbExist;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $_TBL_EXERCISES WHERE id_lang=$_id_lang AND id_exercise=$_selectedExerciseId");
    List<ExerciseItem> _exerciseItem = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; ++i) {
        _exerciseItem.add(ExerciseItem.fromMap(maps[i]));
      }
    }
    return _exerciseItem;
  }
  Future<List<Themes>> getThemesData(String _selectedLanguageId) async {
    var dbClient = await _dbExist;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $_TBL_THEMES WHERE id_lang=$_selectedLanguageId");
    List<Themes> themes = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; ++i) {
        themes.add(Themes.fromMap(maps[i]));
      }
    }
    return themes;
  }
  Future<int> updateThemes(Themes themes) async {
    var dbClient = await _dbExist;

    return await dbClient.update(
      _TBL_THEMES,
      themes.toMap(),
      where: "id_theme = ?",
      whereArgs: [themes.id_theme],
    );
  }
}
