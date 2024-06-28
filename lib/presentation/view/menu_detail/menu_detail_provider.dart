
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_clean_architecture/data/repository/cartitem_repository_impl.dart';
import 'package:test_clean_architecture/domain/usecase/cartitem/get_cart.dart';
import 'package:test_clean_architecture/domain/usecase/cartitem/get_cartitembyid.dart';
import 'package:test_clean_architecture/domain/usecase/cartitem/save_menuincart.dart';
import 'package:test_clean_architecture/domain/usecase/menu_detail/update_favorite.dart';
import 'package:test_clean_architecture/presentation/view/menu_detail/menu_detail_controller.dart';
import 'package:test_clean_architecture/presentation/view/menu_detail/state/menu_detail_state.dart';

import '../../../data/repository/menudetail_repository_impl.dart';
import '../../../domain/repository/cartitem/cartitem_repository.dart';
import '../../../domain/repository/menu_detail/menudetail_repository.dart';
import '../../../domain/usecase/menu_detail/get_menudetail.dart';
import '../../../injection_container.dart';

final menuDetailRepositoryProvider = Provider<MenuDetailRepository>((ref) => MenuDetailRepositoryImpl(
    appDatabase: sl()
));

final cartItemRepositoryProvider = Provider<CartItemRepository>((ref) => CartItemRepositoryImpl(
    appDatabase: sl()
));

final getMenuDetail = Provider((ref) => GetMenuDetailUseCase(menuRepository: ref.read(menuDetailRepositoryProvider)));
final updateFavoriteMenuDetail = Provider((ref) => UpdateFavoriteUseCase(menuRepository: ref.read(menuDetailRepositoryProvider)));

final getCart = Provider((ref) => GetCartUseCase(cartItemRepository: ref.read(cartItemRepositoryProvider)));
final getCartItemById = Provider((ref) => GetCartItemByIdUseCase(cartItemRepository: ref.read(cartItemRepositoryProvider)));
final saveMenuInCart = Provider((ref) => SaveMenuInCartUseCase(cartItemRepository: ref.read(cartItemRepositoryProvider)));

final menuDetailPageStateProvider = StateNotifierProvider.autoDispose<MenuDetailController, MenuDetailState>(
    (ref) => MenuDetailController(
        getMenuDetailUseCase: ref.read(getMenuDetail),
        updateFavoriteUseCase: ref.read(updateFavoriteMenuDetail),
        getCartUseCase: ref.read(getCart),
        getCartItemByIdUseCase: ref.read(getCartItemById),
        saveMenuInCartUseCase: ref.read(saveMenuInCart),
    )
);