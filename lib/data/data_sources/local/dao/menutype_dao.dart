import 'package:floor/floor.dart';
import 'package:test_clean_architecture/domain/entities/home/menutype_entity.dart';

@dao
abstract class MenuTypeDao {
  @Query('SELECT * FROM menu_type')
  Future<List<MenuTypeEntity>> getAllMenuType();

  @insert
  Future<void> insertMenuType(MenuTypeEntity menuTypeModel);
}