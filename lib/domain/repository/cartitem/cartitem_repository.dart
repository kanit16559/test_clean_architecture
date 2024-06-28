
import 'package:test_clean_architecture/domain/entities/cartitem/cart_entity.dart';
import 'package:test_clean_architecture/domain/entities/cartitem/cartitem_entity.dart';

abstract class CartItemRepository {
  Future<List<CartEntity>?> getCartAll();
  Future<void> insertCartItem(int menuId, int quantity);
  Future<List<CartItemEntity>?> getCartItemById(int menuId);
}