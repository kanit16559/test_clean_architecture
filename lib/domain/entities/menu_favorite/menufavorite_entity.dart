import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'menu')
class MenuFavoriteEntity extends Equatable {
  @primaryKey
  final int? id;
  final String? name;
  final String? detail;
  final double? price;
  final String? image;
  final int? menuTypeId;
  final bool? favorite;

  const MenuFavoriteEntity({
    this.id,
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
    detail,
    price,
    image,
    menuTypeId,
    favorite
  ];

}