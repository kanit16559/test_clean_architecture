
import 'package:test_clean_architecture/core/usecase/usercase.dart';
import 'package:test_clean_architecture/domain/repository/cartitem/cartitem_repository.dart';

class SaveMenuInCartUseCase implements UseCase<void, SaveMenuInCartParam>{

  final CartItemRepository cartItemRepository;
  SaveMenuInCartUseCase({
    required this.cartItemRepository
  });


  @override
  Future<void> call(SaveMenuInCartParam params) {
    return cartItemRepository.insertCartItem(params.menuId, params.quantity);
  }

}

class SaveMenuInCartParam {
  final int menuId;
  final int quantity;

  const SaveMenuInCartParam({required this.menuId, required this.quantity});
}

