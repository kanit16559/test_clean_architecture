import '../../entities/home/menu_entity.dart';

abstract class MenuRepository {
  Future<List<MenuEntity>> getAllMenu();
  Future<List<MenuEntity>> getMenuByMenuType(int menuTypeId);
  Future<List<MenuEntity>> getSearchMenu(String strSearch);
  Future<List<MenuEntity>> getSearchMenuByMenuType(int menuTypeId, String strSearch);
  Future<void> saveMenu(MenuEntity menuModel);
}