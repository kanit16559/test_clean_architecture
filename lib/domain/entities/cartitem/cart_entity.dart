
import 'package:floor/floor.dart';

@Entity(tableName: 'cart_item',primaryKeys: ['id'])
class CartEntity {
  final int? id;
  final int? menuId;
  final int? quantity;
  final String? name;
  final String? detail;
  final double? price;
  final String? image;
  final int? menuTypeId;
  final bool? favorite;

  const CartEntity({
    this.id,
    this.menuId,
    this.quantity,
    this.name,
    this.detail,
    this.price,
    this.image,
    this.menuTypeId,
    this.favorite,
  });

  @override
  List<Object?> get props => [
    id,
    menuId,
    quantity,
    detail,
    price,
    image,
    menuTypeId,
    favorite
  ];
}