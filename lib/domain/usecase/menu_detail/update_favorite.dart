import 'package:test_clean_architecture/core/usecase/usercase.dart';
import '../../repository/menu_detail/menudetail_repository.dart';

class UpdateFavoriteUseCase implements UseCase<void, UpdateFavoriteParams>{
  final MenuDetailRepository menuRepository;

  UpdateFavoriteUseCase({
    required this.menuRepository
  });

  @override
  Future<void> call(UpdateFavoriteParams params) {
    return menuRepository.updateFavoriteMenuDetail(params.isFavorite, params.menuId);
  }

}

class UpdateFavoriteParams {
  final bool isFavorite;
  final int menuId;

  UpdateFavoriteParams({
    required this.menuId,
    required this.isFavorite
  });
}