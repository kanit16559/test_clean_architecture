
import '../../../../domain/entities/menu_detail/menudetail_entity.dart';

enum MenuDetailStatus{ initial, loading, success, failure, empty}

MenuDetailState initialMenuDetailState = MenuDetailState();


class MenuDetailState {
  MenuDetailStatus status;
  MenuDetailEntity? value;
  MenuDetailState({
    this.status = MenuDetailStatus.initial,
    this.value
  });

  MenuDetailState copyWith({
    MenuDetailStatus? status,
    MenuDetailEntity? value,
  }) {
    return MenuDetailState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }
}