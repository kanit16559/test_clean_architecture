
import 'package:test_clean_architecture/core/usecase/usercase.dart';
import 'package:test_clean_architecture/domain/entities/cartitem/cartitem_entity.dart';

import '../../repository/cartitem/cartitem_repository.dart';

class GetCartItemByIdUseCase implements UseCase<List<CartItemEntity>?, int> {

  final CartItemRepository cartItemRepository;
  GetCartItemByIdUseCase({
    required this.cartItemRepository
  });


  @override
  Future<List<CartItemEntity>?> call(int params) {
    return cartItemRepository.getCartItemById(params);
  }

}