
import 'package:test_clean_architecture/domain/entities/cartitem/cart_entity.dart';
import 'package:test_clean_architecture/domain/entities/cartitem/cartitem_entity.dart';

import '../../domain/repository/cartitem/cartitem_repository.dart';
import '../data_sources/local/app_database.dart';

class CartItemRepositoryImpl implements CartItemRepository {

  final AppDatabase appDatabase;

  CartItemRepositoryImpl({required this.appDatabase});

  @override
  Future<List<CartEntity>?> getCartAll() {
    return appDatabase.cartItemDao.getCartAll();
  }

  @override
  Future<void> insertCartItem(int menuId, int quantity) {
    return appDatabase.cartItemDao.insertCartItem(menuId, quantity);
  }

  @override
  Future<List<CartItemEntity>?> getCartItemById(int menuId) {
    return appDatabase.cartItemDao.getCartItemById(menuId);
  }

}