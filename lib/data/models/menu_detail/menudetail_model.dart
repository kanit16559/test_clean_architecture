
import 'package:test_clean_architecture/domain/entities/menu_detail/menudetail_entity.dart';

class MenuDetailModel extends MenuDetailEntity {
  const MenuDetailModel({
    super.id,
    super.name,
    super.detail,
    super.price,
    super.image,
    super.menuTypeId,
    super.favorite
  });

  factory MenuDetailModel.fromJson(Map<String, dynamic> map) {
    return MenuDetailModel(
      id: map['id'],
      name: map['name'] ?? "",
      detail: map['name'] ?? "",
      price: map['price'] ?? 0,
      image: map['image'] ?? "",
      menuTypeId: map['menuTypeId'] ?? "",
      favorite: map['favorite'] ?? false,
    );
  }

  factory MenuDetailModel.fromEntity(MenuDetailEntity menuEntity) {
    return MenuDetailModel(
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