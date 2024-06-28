
import 'package:test_clean_architecture/domain/entities/menu_detail/menudetail_entity.dart';

import '../../domain/repository/menu_detail/menudetail_repository.dart';
import '../data_sources/local/app_database.dart';

class MenuDetailRepositoryImpl implements MenuDetailRepository {

  final AppDatabase appDatabase;

  MenuDetailRepositoryImpl({required this.appDatabase});

  @override
  Future<MenuDetailEntity?> getMenuDetail(int menuId) {
    return appDatabase.menuDetailDao.getMenuDetail(menuId);
  }

  @override
  Future<void> updateFavoriteMenuDetail(bool isFavorite, int menuId) {
    return appDatabase.menuDetailDao.updateFavoriteMenuDetail(isFavorite, menuId);
  }

}