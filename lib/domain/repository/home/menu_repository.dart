import 'package:test_clean_architecture/data/models/home/menu_model.dart';

import '../../entities/home/menu_entity.dart';

abstract class MenuRepository {
  Future<List<MenuEntity>> getAllMenu();
  Future<List<MenuEntity>> getSearchMenu(String strSearch);
  Future<void> saveMenu(MenuEntity menuModel);
}