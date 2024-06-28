
import 'package:test_clean_architecture/core/usecase/usercase.dart';
import 'package:test_clean_architecture/domain/entities/menu_detail/menudetail_entity.dart';
import 'package:test_clean_architecture/domain/entities/menu_favorite/menufavorite_entity.dart';

import '../../repository/menu_favorite/menufavorite_repository.dart';

class GetMenuFavoriteUseCase implements UseCase<List<MenuFavoriteEntity>, NoParams>{

  final MenuFavoriteRepository menuRepository;

  GetMenuFavoriteUseCase({
    required this.menuRepository
  });

  @override
  Future<List<MenuFavoriteEntity>> call(NoParams params) {
    return menuRepository.getMenuFavorite();
  }

}