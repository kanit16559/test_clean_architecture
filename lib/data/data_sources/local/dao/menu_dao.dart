
import 'package:floor/floor.dart';

import '../../../../domain/entities/home/menu_entity.dart';

@dao
abstract class MenuDao {
  @Query('SELECT * FROM menu')
  Future<List<MenuEntity>> getAllMenu();

  @Query('SELECT * FROM menu WHERE menuTypeId = :menuTypeId')
  Future<List<MenuEntity>> getMenuByMenuType(int menuTypeId);

  @Query("SELECT * FROM menu WHERE name LIKE ':strSearch'")
  Future<List<MenuEntity>> getSearchMenu(String strSearch);

  @Query("SELECT * FROM menu WHERE menuTypeId = :menuTypeId AND name LIKE :strSearch")
  Future<List<MenuEntity>> getSearchMenuByMenuType(int menuTypeId, String strSearch);

  @insert
  Future<void> insertMenu(MenuEntity menu);
}