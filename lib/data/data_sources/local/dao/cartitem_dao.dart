
import 'package:floor/floor.dart';

import '../../../../domain/entities/cartitem/cart_entity.dart';
import '../../../../domain/entities/cartitem/cartitem_entity.dart';

@dao
abstract class CartItemDao {

  @Query("""
      SELECT
      cart_item.id ,
      cart_item.menuId,
      cart_item.quantity,
      menu.name,
      menu.detail,
      menu.image,
      menu.menuTypeId,
      menu.favorite
      FROM
      cart_item
      INNER JOIN
      menu on cart_item.menuId = menu.id
      """)
  Future<List<CartEntity>?> getCartAll();

  @Query('SELECT cart_item.menuId FROM cart_item WHERE menuId = :menuId')
  Future<List<CartItemEntity>?> getCartItemById(int menuId);

  @Query('INSERT INTO cart_item (menuId, quantity) VALUES (:menuId, :quantity)')
  Future<void> insertCartItem(int menuId, int quantity);

}