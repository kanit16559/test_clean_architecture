import 'package:floor/floor.dart';
import 'package:test_clean_architecture/domain/entities/menu_detail/menudetail_entity.dart';


@dao
abstract class MenuDetailDao {

  @Query('SELECT * FROM menu WHERE id = :menuId')
  Future<MenuDetailEntity?> getMenuDetail(int menuId);

  @Query('UPDATE menu SET favorite = :isFavorite WHERE  id = :menuId')
  Future<void> updateFavoriteMenuDetail(bool isFavorite, int menuId);

}