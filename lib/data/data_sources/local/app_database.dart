
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:test_clean_architecture/data/data_sources/local/dao/menu_dao.dart';
import 'package:test_clean_architecture/data/data_sources/local/dao/menutype_dao.dart';
import 'package:test_clean_architecture/data/data_sources/local/dao/menudetail_dao.dart';
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';
import 'package:test_clean_architecture/domain/entities/home/menutype_entity.dart';
import 'package:test_clean_architecture/domain/entities/menu_favorite/menufavorite_entity.dart';

import '../../../domain/entities/cartitem/cart_entity.dart';
import '../../../domain/entities/cartitem/cartitem_entity.dart';
import '../../../domain/entities/menu_detail/menudetail_entity.dart';
import 'dao/cartitem_dao.dart';
import 'dao/menufavorite_dao.dart';


part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    MenuEntity,
    MenuTypeEntity,
    MenuDetailEntity,
    MenuFavoriteEntity,
    MenuFavoriteEntity,
    CartItemEntity,
    CartEntity
  ]
)

abstract class AppDatabase extends FloorDatabase {
  MenuDao get menuDAO;
  MenuTypeDao get menuTypeDAO;
  MenuDetailDao get menuDetailDao;
  MenuFavoriteDao get menuFavoriteDao;
  CartItemDao get cartItemDao;
}