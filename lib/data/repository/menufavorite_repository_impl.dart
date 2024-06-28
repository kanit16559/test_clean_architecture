import 'package:test_clean_architecture/domain/entities/menu_favorite/menufavorite_entity.dart';

import '../../domain/repository/menu_favorite/menufavorite_repository.dart';
import '../data_sources/local/app_database.dart';

class MenuFavoriteRepositoryImpl implements MenuFavoriteRepository {

  final AppDatabase appDatabase;

  MenuFavoriteRepositoryImpl({required this.appDatabase});

  @override
  Future<List<MenuFavoriteEntity>> getMenuFavorite() {
    return appDatabase.menuFavoriteDao.getMenuFavorite();
    // throw();
  }

}