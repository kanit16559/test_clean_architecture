import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test_clean_architecture/domain/usecase/home/get_menubymenutype.dart';
import 'package:test_clean_architecture/presentation/view/home/state/home_state.dart';

import '../../../core/usecase/usercase.dart';
import '../../../domain/entities/home/menu_entity.dart';
import '../../../domain/usecase/home/get_menu.dart';
import '../../../domain/usecase/home/get_searchmenu.dart';
import '../../../domain/usecase/home/get_searchmenubymenutype.dart';

class HomeController extends StateNotifier<HomeState>{

  final GetMenuUseCase _getMenuUseCase;
  final GetMenuByMenuTypeUseCase _getMenuByMenuTypeUseCase;
  final GetSearchMenuUseCase _getSearchMenuUseCase;
  final GetSearchMenuByMenuTypeUseCase _getSearchMenuByMenuTypeUseCase;


  HomeController({
    required GetMenuUseCase getMenuUseCase,
    required GetMenuByMenuTypeUseCase getMenuByMenuTypeUseCase,
    required GetSearchMenuByMenuTypeUseCase getSearchMenuByMenuTypeUseCase,
    required GetSearchMenuUseCase getSearchMenuUseCase,
  }):
      _getSearchMenuUseCase = getSearchMenuUseCase,
      _getMenuByMenuTypeUseCase = getMenuByMenuTypeUseCase,
      _getSearchMenuByMenuTypeUseCase = getSearchMenuByMenuTypeUseCase,
      _getMenuUseCase = getMenuUseCase,
      super(initialHomeState);

  final TextEditingController _textSearchController = TextEditingController();

  TextEditingController get textSearchController => _textSearchController;

  void onTapSelectMenuType(int menuTypeId){
    if(state.menuTypeSelect == menuTypeId){
      state = state.copyWith(
        menuTypeSelect: 0
      );
      return;
    }
    state = state.copyWith(
      menuTypeSelect: menuTypeId
    );
  }

  Future<void> getAllMenu() async {
    MenuState menuState = state.menuState.copyWith(
      status: HomeStatus.loading
    );
    state = state.copyWith(
      menuState: menuState
    );

    try{
      List<MenuEntity> response = await _getMenu(state.menuTypeSelect);

      menuState = state.menuState.copyWith(
          status: HomeStatus.success,
          value: List.from(response)
      );
      state = state.copyWith(
          menuState: menuState
      );
    }catch(error){
      MenuState menuState = state.menuState.copyWith(
        status: HomeStatus.failure,
        value: []
      );
      state = state.copyWith(
        menuState: menuState
      );
    }
  }

  Future<void> getSearchMenu(String strSearch) async {
    if(strSearch.isEmpty){
      getAllMenu();
      return;
    }

    MenuState menuState = state.menuState.copyWith(
        status: HomeStatus.loading
    );
    state = state.copyWith(
        menuState: menuState
    );

    // await Future.delayed(const Duration(milliseconds: 1500));
    try{
      final searchQuery = '$strSearch%';
      List<MenuEntity> response = await _getSearchMenu(state.menuTypeSelect, searchQuery);
      if(response.isEmpty){
        menuState = state.menuState.copyWith(
          status: HomeStatus.empty,
          value: []
        );
        state = state.copyWith(
          menuState: menuState
        );
        return;
      }
      menuState = state.menuState.copyWith(
          status: HomeStatus.success,
          value: List.from(response)
      );
      state = state.copyWith(
          menuState: menuState
      );
    }catch(error){
      MenuState menuState = state.menuState.copyWith(
          status: HomeStatus.failure,
          value: []
      );
      state = state.copyWith(
          menuState: menuState
      );
    }
  }

  Future<List<MenuEntity>> _getMenu(int menuTypeId) async {
    if(menuTypeId == 0){
      return _getMenuUseCase.call(NoParams());
    }
    return _getMenuByMenuTypeUseCase.call(menuTypeId);
  }

  Future<List<MenuEntity>> _getSearchMenu(int menuTypeId, String strSearch) async {
    if(menuTypeId == 0){
      return _getSearchMenuUseCase.call(strSearch);
    }
    final pragma = GetSearchMenuByMenuTypeParam(
      menuTypeId,
      strSearch
    );

    return _getSearchMenuByMenuTypeUseCase.call(pragma);
  }

}