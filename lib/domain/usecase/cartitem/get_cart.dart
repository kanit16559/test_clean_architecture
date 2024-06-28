import 'package:test_clean_architecture/core/usecase/usercase.dart';
import 'package:test_clean_architecture/domain/entities/cartitem/cart_entity.dart';

import '../../repository/cartitem/cartitem_repository.dart';

class GetCartUseCase implements UseCase<List<CartEntity>?, NoParams> {

  final CartItemRepository cartItemRepository;

  GetCartUseCase({
    required this.cartItemRepository
  });

  @override
  Future<List<CartEntity>?> call(params) {
    return cartItemRepository.getCartAll();
  }

}