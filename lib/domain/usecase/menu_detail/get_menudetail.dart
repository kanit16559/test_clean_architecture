
import '../../../core/usecase/usercase.dart';
import '../../entities/menu_detail/menudetail_entity.dart';
import '../../repository/menu_detail/menudetail_repository.dart';

class GetMenuDetailUseCase implements UseCase<MenuDetailEntity?, int>{
  final MenuDetailRepository menuRepository;
  GetMenuDetailUseCase({
    required this.menuRepository
  });

  @override
  Future<MenuDetailEntity?> call(int params) {
    return menuRepository.getMenuDetail(params);
  }

}