
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/presentation/view/menu_favorite/state/menu_favorite_state.dart';

import '../../../data/repository/menufavorite_repository_impl.dart';
import '../../../domain/repository/menu_favorite/menufavorite_repository.dart';
import '../../../domain/usecase/menu_favorite/get_menufavorite.dart';
import '../../../injection_container.dart';
import 'menu_favorite_controller.dart';

final menuFavoriteRepositoryProvider = Provider<MenuFavoriteRepository>((ref) => MenuFavoriteRepositoryImpl(
    appDatabase: sl()
));

final getMenuFavorite = Provider((ref) => GetMenuFavoriteUseCase(menuRepository: ref.read(menuFavoriteRepositoryProvider)));

final menuFavoritePageStateProvider = StateNotifierProvider.autoDispose<MenuFavoriteController, MenuFavoriteState>(
        (ref) => MenuFavoriteController(
      getMenuFavoriteUseCase: ref.read(getMenuFavorite),
    )
);