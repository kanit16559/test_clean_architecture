import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'menu_type', primaryKeys: ['id'])
class MenuTypeEntity extends Equatable {
  final int? id;
  final String? type;


  const MenuTypeEntity({
    this.id,
    this.type,
  });

  @override
  List<Object?> get props => [
    id,
    type,
  ];

}