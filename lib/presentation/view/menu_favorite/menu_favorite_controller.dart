import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/core/usecase/usercase.dart';
import 'package:test_clean_architecture/domain/usecase/menu_favorite/get_menufavorite.dart';
import 'package:test_clean_architecture/presentation/view/menu_favorite/state/menu_favorite_state.dart';

import '../../../domain/entities/menu_favorite/menufavorite_entity.dart';

class MenuFavoriteController extends StateNotifier<MenuFavoriteState>{

  final GetMenuFavoriteUseCase _getMenuFavoriteUseCase;

  MenuFavoriteController({
    required GetMenuFavoriteUseCase getMenuFavoriteUseCase,
  }) :
    _getMenuFavoriteUseCase = getMenuFavoriteUseCase,
    super(initialMenuFavoriteState);

  Future<void> getMenuFavorite() async {
    state = state.copyWith(
      status: MenuFavoriteStatus.loading
    );

    try{
      List<MenuFavoriteEntity>? response = (await _getMenuFavoriteUseCase.call(NoParams()));
      state = state.copyWith(
          status: MenuFavoriteStatus.success,
          value: response
      );
    }catch(error){
      state = state.copyWith(
          status: MenuFavoriteStatus.failure,
          value: null
      );
    }
  }
}