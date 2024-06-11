import 'package:test_clean_architecture/data/models/home/menu_model.dart';
import 'package:test_clean_architecture/domain/entities/home/menu_entity.dart';

import '../../domain/repository/home/menu_repository.dart';
import '../data_sources/local/app_database.dart';

class MenuRepositoryImpl implements MenuRepository {
  final AppDatabase appDatabase;

  MenuRepositoryImpl({required this.appDatabase});

  @override
  Future<List<MenuEntity>> getAllMenu() async {
    await Future.delayed(const Duration(seconds: 3));
    return appDatabase.menuDAO.getAllMenu();
  }

  @override
  Future<List<MenuEntity>> getSearchMenu(String strSearch) async {
    await Future.delayed(const Duration(seconds: 3));
    return appDatabase.menuDAO.getSearchMenu(strSearch);
  }


  @override
  Future<void> saveMenu(MenuEntity menuModel) {
    return appDatabase.menuDAO.insertMenu(menuModel);
  }

 
}