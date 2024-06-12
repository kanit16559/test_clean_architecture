
import 'package:test_clean_architecture/core/usecase/usercase.dart';

import '../../entities/home/menu_entity.dart';
import '../../repository/home/menu_repository.dart';

class GetMenuByMenuTypeUseCase implements UseCase<List<MenuEntity>, int>{
  final MenuRepository menuRepository;
  GetMenuByMenuTypeUseCase({
    required this.menuRepository
  });

  @override
  Future<List<MenuEntity>> call(int params) {
    return menuRepository.getMenuByMenuType(params);
  }

}