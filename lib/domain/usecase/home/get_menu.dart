import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

import '../../../core/usecase/usercase.dart';
import '../../repository/home/menu_repository.dart';

class GetMenuUseCase implements UseCase<List<MenuEntity>, NoParams>{
  final MenuRepository menuRepository;
  GetMenuUseCase({
    required this.menuRepository
  });

  @override
  Future<List<MenuEntity>> call(NoParams noParams) {
    return menuRepository.getAllMenu();
  }

}


// class GetMenuUseCase {
//   final MenuRepository menuRepository;
//   GetMenuUseCase({
//     required this.menuRepository
//   });
//   Future<List<MenuEntity>> call() {
//     return menuRepository.getAllMenu();
//   }
//
// }