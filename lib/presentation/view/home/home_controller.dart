import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test_clean_architecture/presentation/view/home/state/home_state.dart';

import '../../../core/usecase/usercase.dart';
import '../../../data/models/home/menu_model.dart';
import '../../../domain/entities/home/menu_entity.dart';
import '../../../domain/usecase/home/get_menu.dart';
import '../../../domain/usecase/home/get_searchmenu.dart';

class HomeController extends StateNotifier<HomeState>{

  final GetMenuUseCase getMenuUseCase;
  final GetSearchMenuUseCase getSearchMenuUseCase;
  final HomeState homeState;

  HomeController({
    required this.homeState,
    required this.getMenuUseCase,
    required this.getSearchMenuUseCase,
  }) : super(initialHomeState);


   final TextEditingController _textSearchController = TextEditingController();

   TextEditingController get textSearchController => _textSearchController;

  void getAllMenu() async {
    MenuState menuState = state.menuState.copyWith(
      status: HomeStatus.loading
    );
    state = state.copyWith(
      menuState: menuState
    );

    try{
      List<MenuEntity> response = await getMenuUseCase.call(NoParams());
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


  void getSearchMenu(){

  }
}