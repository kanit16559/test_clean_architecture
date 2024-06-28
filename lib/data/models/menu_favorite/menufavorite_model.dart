
import '../../../domain/entities/menu_favorite/menufavorite_entity.dart';

class MenuFavoriteModel extends MenuFavoriteEntity {
  const MenuFavoriteModel({
    super.id,
    super.name,
    super.detail,
    super.price,
    super.image,
    super.menuTypeId,
    super.favorite
  });

  factory MenuFavoriteModel.fromJson(Map<String, dynamic> map) {
    return MenuFavoriteModel(
      id: map['id'],
      name: map['name'] ?? "",
      detail: map['name'] ?? "",
      price: map['price'] ?? 0,
      image: map['image'] ?? "",
      menuTypeId: map['menuTypeId'] ?? "",
      favorite: map['favorite'] ?? false,
    );
  }

  factory MenuFavoriteModel.fromEntity(MenuFavoriteEntity menuEntity) {
    return MenuFavoriteModel(
      id: menuEntity.id,
      name: menuEntity.name,
      detail: menuEntity.detail,
      price: menuEntity.price,
      image: menuEntity.image,
      menuTypeId: menuEntity.menuTypeId,
      favorite: menuEntity.favorite,
    );
  }
}