import 'package:floor/floor.dart';
import '../../../../domain/entities/menu_favorite/menufavorite_entity.dart';

@dao
abstract class MenuFavoriteDao {

  @Query('SELECT * FROM  menu WHERE favorite = 1')
  Future<List<MenuFavoriteEntity>> getMenuFavorite();

}