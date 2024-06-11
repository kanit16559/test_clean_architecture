import '../../../domain/entities/home/menutype_emtity.dart';


class MenuTypeModel extends MenuTypeEntity {
  const MenuTypeModel({
    super.id,
    super.type,
  });

  factory MenuTypeModel.fromJson(Map<String, dynamic> map) {
    return MenuTypeModel(
      id: map['id'],
      type: map['type'] ?? "",
    );
  }

  factory MenuTypeModel.fromEntity(MenuTypeEntity menuEntity) {
    return MenuTypeModel(
      id: menuEntity.id,
      type: menuEntity.type,
    );
  }
}