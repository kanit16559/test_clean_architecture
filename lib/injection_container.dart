import 'package:get_it/get_it.dart';
import 'data/data_sources/local/app_database.dart';
import 'data/models/home/menu_model.dart';
import 'data/models/home/menutype_model.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await _initializeDataBaseBuilder();
}


Future<void> _initializeDataBaseBuilder() async {
  final database = await $FloorAppDatabase.databaseBuilder('demo_cashier.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // await _insertDataMenuDemo();
  // await _insertDataMenuTypeDemo();

  // await _getDataMenuDemo();
  // await _getDataMenuTypeDemo();
}

Future<void> _insertDataMenuDemo() async {
  AppDatabase menuDao = sl<AppDatabase>();

  const List<MenuModel> menuModelList= [
    MenuModel( //1
      name: "Triple Beef Cheeseburger (Beef)",
      price: 179.00,
      image: "https://d1vs91ctevllei.cloudfront.net/images/product/1594018720072_MCD_Menu-Icon_600x400px_Alacarte_Triple-Beef-Cheese_Final.jpg",
      menuTypeId: 1,
      favorite: false
    ),
    MenuModel( //2
      name: "Double Cheeseburger (Beef)",
      price: 139.00,
      image: "https://d1vs91ctevllei.cloudfront.net/images/product/1593425086035.jpg",
      menuTypeId: 1,
      favorite: false
    ),
    MenuModel( //3
      name: "Big Mac. (Beef)",
      price: 149.00,
      image: "https://d1vs91ctevllei.cloudfront.net/images/product/16053547921604341598600x400.png",
      menuTypeId: 1,
      favorite: true
    ),
    MenuModel( //4
      name: "Double Cheese",
      price: 299.00,
      image: "https://www.1112.com/_next/image?url=https%3A%2F%2Fcdn.1112.com%2F1112%2Fpublic%2Fimages%2Fproducts%2Fpizza%2FTopping%2F102216.png&w=640&q=75",
      menuTypeId: 2,
      favorite: true
    ),
    MenuModel( //5
      name: "Spicy Super Seafood",
      price: 439.00,
      image: "https://www.1112.com/_next/image?url=https%3A%2F%2Fcdn.1112.com%2F1112%2Fpublic%2Fimages%2Fproducts%2Fpizza%2FTopping%2F102734.png&w=640&q=75",
      menuTypeId: 2,
      favorite: false
    ),
    MenuModel( //6
      name: "Chicken Ham Croque Monsieur",
      price: 125.00,
      image: "https://www.starbucks.co.th/stb-media/2024/05/Summer2_Chicken-Ham-Croque-Monsieur-copy.jpg",
      menuTypeId: 3,
      favorite: true
    ),
    MenuModel( //7
      name: "Multigrain Chicken Ham and 3 Cheeses",
      price: 165.00,
      image: "https://www.starbucks.co.th/stb-media/2024/05/Summer2_Multigrain-Chicken-Ham-and-3-Cheese_GBG.jpg",
      menuTypeId: 3,
      favorite: false
    ),
    MenuModel( //8
      name: "Thunder Roll",
      price: 1250.00,
      image: "https://www.shichi.co.th/wp-content/uploads/2021/06/Thunder-Roll.jpg",
      menuTypeId: 4,
      favorite: true
    ),
    MenuModel( //9
      name: "Salmon Skin Maki",
      price: 220.00,
      image: "https://www.shichi.co.th/wp-content/uploads/2021/06/Salmon-Skin-Maki.jpg",
      menuTypeId: 4,
      favorite: false
    ),
    MenuModel( //10
      name: "3 PCS. WINGZ ZABB",
      price: 90,
      image: "https://images.ctfassets.net/n4pc9wlortyn/2J67QA2guNagN1PKGXKXih/600a61820ae57f7aaf7c016e9b1eb7d1/3_pcs._WingZ_Zabb_480x388.png?h=600&w=800&fit=fill&fm=webp",
      menuTypeId: 5,
      favorite: true
    ),
  ];

  for (var element in menuModelList) {
    await menuDao.menuDAO.insertMenu(element);
  }
}

Future<void> _getDataMenuDemo() async {
  AppDatabase menuDao = sl<AppDatabase>();
  final response = await menuDao.menuDAO.getAllMenu();
  print('--- Menu: ${response}');
}

Future<void> _insertDataMenuTypeDemo() async {
  AppDatabase menuDao = sl<AppDatabase>();

  const List<MenuTypeModel> menuModelTypeList = [
    MenuTypeModel(
      id: 1,
      type: "hamburger"
    ),
    MenuTypeModel(
        id: 2,
        type: "pizza"
    ),
    MenuTypeModel(
      id: 3,
      type: "sandwich"
    ),
    MenuTypeModel(
        id: 4,
        type: "roll"
    ),
    MenuTypeModel(
        id: 5,
        type: "fried chicken"
    ),
  ];

  for (var element in menuModelTypeList) {
    await menuDao.menuTypeDAO.insertMenuType(element);
  }
}

Future<void> _getDataMenuTypeDemo() async {
  AppDatabase menuDao = sl<AppDatabase>();
  final response = await menuDao.menuTypeDAO.getAllMenuType();
  print('--- MenuType: ${response}');
}