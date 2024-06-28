
import '../../../../domain/entities/menu_detail/menudetail_entity.dart';
import '../../../../domain/entities/menu_favorite/menufavorite_entity.dart';

enum MenuFavoriteStatus{ initial, loading, success, failure, empty}

MenuFavoriteState initialMenuFavoriteState = MenuFavoriteState();


class MenuFavoriteState {
  MenuFavoriteStatus status;
  List<MenuFavoriteEntity>? value;
  MenuFavoriteState({
    this.status = MenuFavoriteStatus.initial,
    this.value
  });

  MenuFavoriteState copyWith({
    MenuFavoriteStatus? status,
    List<MenuFavoriteEntity>? value
  }) {
    return MenuFavoriteState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }
}