
import '../../../core/usecase/usercase.dart';
import '../../entities/home/menu_entity.dart';
import '../../repository/home/menu_repository.dart';

class GetSearchMenuByMenuTypeUseCase implements UseCase<List<MenuEntity>, GetSearchMenuByMenuTypeParam>{
  final MenuRepository menuRepository;
  GetSearchMenuByMenuTypeUseCase({
    required this.menuRepository
  });

  @override
  Future<List<MenuEntity>> call(GetSearchMenuByMenuTypeParam params) {
    return menuRepository.getSearchMenuByMenuType(params.menuTypeId, params.strSearch);
  }
}

class GetSearchMenuByMenuTypeParam {
  final int menuTypeId;
  final String strSearch;

  const GetSearchMenuByMenuTypeParam(this.menuTypeId, this.strSearch);
}