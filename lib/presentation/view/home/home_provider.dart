import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/domain/repository/home/menu_repository.dart';
import 'package:test_clean_architecture/domain/usecase/home/get_menubymenutype.dart';
import 'package:test_clean_architecture/presentation/view/home/state/home_state.dart';
import '../../../data/repository/menu_repository_impl.dart';
import '../../../domain/usecase/home/get_menu.dart';
import '../../../domain/usecase/home/get_searchmenu.dart';
import '../../../domain/usecase/home/get_searchmenubymenutype.dart';
import '../../../injection_container.dart';
import 'home_controller.dart';

final menuRepositoryProvider = Provider<MenuRepository>((ref) => MenuRepositoryImpl(
  appDatabase: sl()
));

final getMenu = Provider((ref) => GetMenuUseCase(menuRepository: ref.read(menuRepositoryProvider)));
final getMenuByMenuType = Provider((ref) => GetMenuByMenuTypeUseCase(menuRepository: ref.read(menuRepositoryProvider)));
final getSearchMenu = Provider((ref) => GetSearchMenuUseCase(menuRepository: ref.read(menuRepositoryProvider)));
final getSearchMenuByMenuType = Provider((ref) => GetSearchMenuByMenuTypeUseCase(menuRepository: ref.read(menuRepositoryProvider)));

final homePageStateProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(
    getMenuUseCase: ref.read(getMenu),
    getMenuByMenuTypeUseCase: ref.read(getMenuByMenuType),
    getSearchMenuUseCase: ref.read(getSearchMenu),
    getSearchMenuByMenuTypeUseCase: ref.read(getSearchMenuByMenuType)
));