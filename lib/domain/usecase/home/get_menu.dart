import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

import '../../../core/usecase/usercase.dart';
import '../../../data/models/home/menu_model.dart';
import '../../repository/home/menu_repository.dart';

class GetMenuUseCase implements UserCase<List<MenuEntity>, NoParams>{
  final MenuRepository menuRepository;
  GetMenuUseCase({
    required this.menuRepository
  });

  @override
  Future<List<MenuEntity>> call(NoParams noParams) {
    return menuRepository.getAllMenu();
  }

}