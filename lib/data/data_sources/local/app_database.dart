
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:test_clean_architecture/data/data_sources/local/dao/menu_dao.dart';
import 'package:test_clean_architecture/data/data_sources/local/dao/menutype_dao.dart';
import 'package:test_clean_architecture/data/models/home/menutype_model.dart';
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';
import 'package:test_clean_architecture/domain/entities/home/menutype_emtity.dart';


part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    MenuEntity,
    MenuTypeEntity
  ]
)

abstract class AppDatabase extends FloorDatabase {
  MenuDao get menuDAO;
  MenuTypeDao get menuTypeDAO;
}