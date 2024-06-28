import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/domain/entities/cartitem/cartitem_entity.dart';
import 'package:test_clean_architecture/domain/usecase/cartitem/get_cart.dart';
import 'package:test_clean_architecture/domain/usecase/cartitem/save_menuincart.dart';
import 'package:test_clean_architecture/domain/usecase/menu_detail/update_favorite.dart';
import 'package:test_clean_architecture/presentation/view/menu_detail/state/menu_detail_state.dart';

import '../../../domain/entities/menu_detail/menudetail_entity.dart';
import '../../../domain/usecase/cartitem/get_cartitembyid.dart';
import '../../../domain/usecase/menu_detail/get_menudetail.dart';

class MenuDetailController extends StateNotifier<MenuDetailState>{

  GetMenuDetailUseCase _getMenuDetailUseCase;
  UpdateFavoriteUseCase _updateFavoriteUseCase;

  GetCartUseCase _getCartUseCase;
  GetCartItemByIdUseCase _getCartItemByIdUseCase;
  SaveMenuInCartUseCase _saveMenuInCartUseCase;

  MenuDetailController({
    required GetMenuDetailUseCase getMenuDetailUseCase,
    required UpdateFavoriteUseCase updateFavoriteUseCase,
    required GetCartUseCase getCartUseCase,
    required GetCartItemByIdUseCase getCartItemByIdUseCase,
    required SaveMenuInCartUseCase saveMenuInCartUseCase,
  }) :
    _getMenuDetailUseCase = getMenuDetailUseCase,
    _updateFavoriteUseCase = updateFavoriteUseCase,
    _getCartUseCase = getCartUseCase,
    _getCartItemByIdUseCase = getCartItemByIdUseCase,
    _saveMenuInCartUseCase = saveMenuInCartUseCase,
    super(initialMenuDetailState);


  int _quantity = 1;

  int get quantity => _quantity;

  Future<void> getMenuDetail(int menuId, {bool isShowLoading = true}) async {

    if(isShowLoading == true){
      state = state.copyWith(
        status: MenuDetailStatus.loading
      );
    }

    try{
      MenuDetailEntity? response = await _getMenuDetailUseCase.call(menuId);
      state = state.copyWith(
        status: MenuDetailStatus.success,
        value: response
      );
    }catch(error){
      state = state.copyWith(
        status: MenuDetailStatus.failure,
        value: null
      );
    }
  }

  Future<void> updateFavoriteMenuDetail(MenuDetailEntity menuDetail) async{
    UpdateFavoriteParams params = UpdateFavoriteParams(
      isFavorite: !(menuDetail.favorite ?? false),
      menuId: menuDetail.id ?? 0
    );
    try{
      await _updateFavoriteUseCase.call(params);
      getMenuDetail(menuDetail.id!);
    }catch(error){
      print('=== ${error}');
    }
  }

  Future<void> saveMenuInCart(MenuDetailEntity menuDetail, int quantity) async{
    SaveMenuInCartParam params =  SaveMenuInCartParam(
        menuId: menuDetail.id ?? 0,
        quantity: quantity
    );


    try{
      List<CartItemEntity>? getItem = await _getCartItemByIdUseCase.call(1);
      print('==== ${getItem}');
      // await _saveMenuInCartUseCase.call(params);
      getMenuDetail(menuDetail.id!);
    }catch(error){
      print('=== ${error}');
    }
  }

}