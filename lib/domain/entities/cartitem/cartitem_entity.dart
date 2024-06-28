
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

@Entity(
  tableName: 'cart_item',
  primaryKeys: ['id'],
  foreignKeys: [
    ForeignKey(
      childColumns: ['menuId'],
      parentColumns: ['id'],
      entity: MenuEntity,
    )
  ],
)
class CartItemEntity extends Equatable{
  final int? id;
  final int? menuId;
  final int? quantity;

  const CartItemEntity({
    this.id,
    this.menuId,
    this.quantity
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    menuId,
    quantity
  ];


}