import '../../../../domain/entities/home/menu_entity.dart';

enum HomeStatus{ initial, loading, success, failure, empty}

HomeState initialHomeState = HomeState(
  menuState: MenuState()
);

class HomeState {
  final MenuState menuState;
  final int menuTypeSelect;

  HomeState({
    required this.menuState,
    this.menuTypeSelect = 0
  });

  HomeState copyWith({
    MenuState? menuState,
    int? menuTypeSelect,
  }) {
    return HomeState(
      menuState: menuState ?? this.menuState,
      menuTypeSelect: menuTypeSelect ?? this.menuTypeSelect,
    );
  }
}


class MenuState {
  HomeStatus status;
  List<MenuEntity>? value;
  MenuState({
    this.status = HomeStatus.initial,
    this.value
  });

  MenuState copyWith({
    HomeStatus? status,
    List<MenuEntity>? value,
  }) {
    return MenuState(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }
}