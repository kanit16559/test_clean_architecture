
import 'package:floor/floor.dart';
import 'package:test_clean_architecture/data/models/home/menu_model.dart';

import '../../../../domain/entities/home/menu_entity.dart';

@dao
abstract class MenuDao {
  @Query('SELECT * FROM menu')
  Future<List<MenuEntity>> getAllMenu();

  @Query("SELECT * FROM menu WHERE name LIKE ':strSearch%'")
  Future<List<MenuEntity>> getSearchMenu(String strSearch);

  @insert
  Future<void> insertMenu(MenuEntity menu);
}