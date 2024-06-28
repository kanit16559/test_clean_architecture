import '../../entities/menu_favorite/menufavorite_entity.dart';

abstract class MenuFavoriteRepository {
  Future<List<MenuFavoriteEntity>> getMenuFavorite();
}