
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

// import '../../../core/usecase/usercase.dart';
import '../../../core/usecase/usercase.dart';
import '../../repository/home/menu_repository.dart';

class GetSearchMenuUseCase implements UserCase<List<MenuEntity>, String>{
  final MenuRepository menuRepository;
  GetSearchMenuUseCase({
    required this.menuRepository
  });

  @override
  Future<List<MenuEntity>> call(String params) {
    return menuRepository.getSearchMenu(params);
  }

}