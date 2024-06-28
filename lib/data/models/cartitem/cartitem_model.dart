import 'package:test_clean_architecture/domain/entities/cartitem/cartitem_entity.dart';

class CartItemModel extends CartItemEntity {

  const CartItemModel({
    super.id,
    super.menuId,
    super.quantity
  });


  factory CartItemModel.fromJson(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      menuId: map['menuId'] ?? 0,
      quantity: map['name'] ?? 0,
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity cartItemEntity) {
    return CartItemModel(
      id: cartItemEntity.id,
      menuId: cartItemEntity.menuId,
      quantity: cartItemEntity.quantity,
    );
  }
}