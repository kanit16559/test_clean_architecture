import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

class MenuModel extends MenuEntity {
  const MenuModel({
    super.id,
    super.name,
    super.price,
    super.image,
    super.menuTypeId,
    super.favorite
  });

  factory MenuModel.fromJson(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id'],
      name: map['name'] ?? "",
      price: map['price'] ?? 0,
      image: map['image'] ?? "",
      menuTypeId: map['menuTypeId'] ?? "",
      favorite: map['favorite'] ?? false,
    );
  }

  factory MenuModel.fromEntity(MenuEntity menuEntity) {
    return MenuModel(
      id: menuEntity.id,
      name: menuEntity.name,
      price: menuEntity.price,
      image: menuEntity.image,
      menuTypeId: menuEntity.menuTypeId,
      favorite: menuEntity.favorite,
    );
  }
}