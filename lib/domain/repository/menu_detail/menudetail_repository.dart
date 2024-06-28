import '../../entities/menu_detail/menudetail_entity.dart';

abstract class MenuDetailRepository {
  Future<MenuDetailEntity?> getMenuDetail(int menuId);
  Future<void> updateFavoriteMenuDetail(bool isFavorite, int menuId);
}