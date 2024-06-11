import '../../../../domain/entities/home/menu_entity.dart';

enum HomeStatus{ initial, loading, success, failure}

HomeState initialHomeState = HomeState(
  menuState: MenuState()
);

class HomeState {
  final MenuState menuState;

  HomeState({
    required this.menuState
  });

  HomeState copyWith({
    MenuState? menuState,
  }) {
    return HomeState(
      menuState: menuState ?? this.menuState,
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