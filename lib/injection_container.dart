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
  //
  // await _getDataMenuDemo();
  // await _getDataMenuTypeDemo();
}

Future<void> _insertDataMenuDemo() async {
  AppDatabase menuDao = sl<AppDatabase>();

  const List<MenuModel> menuModelList= [
    MenuModel( //1
      name: "Triple Beef Cheeseburger (Beef)",
      detail: "The Triple Cheeseburger is made up of three 100% pure beef patties with absolutely no fillers, additives or preservatives, simply seasoned with a pinch of salt and pepper and topped with tangy pickles, chopped onions, ketchup, mustard and two slices of melty American cheese.",
      price: 179.00,
      image: "https://d1vs91ctevllei.cloudfront.net/images/product/1594018720072_MCD_Menu-Icon_600x400px_Alacarte_Triple-Beef-Cheese_Final.jpg",
      menuTypeId: 1,
      favorite: false
    ),
    MenuModel( //2
      name: "Double Cheeseburger (Beef)",
      detail: "Love our Cheeseburger? Double it! Think two 100% beef patties with cheese, onions, pickles, mustard and a dollop of tomato ketchup, all in a perfectly soft bun.",
      price: 139.00,
      image: "https://d1vs91ctevllei.cloudfront.net/images/product/1593425086035.jpg",
      menuTypeId: 1,
      favorite: false
    ),
    MenuModel( //3
      name: "Big Mac. (Beef)",
      detail: "Two 100% beef patties, a slice of cheese, lettuce, onion and pickles. And the sauce. That unbeatable, tasty Big Mac® sauce. You know you want to.",
      price: 149.00,
      image: "https://d1vs91ctevllei.cloudfront.net/images/product/16053547921604341598600x400.png",
      menuTypeId: 1,
      favorite: true
    ),
    MenuModel( //4
      name: "Double Cheese",
      detail: "Double Cheese Pizza. Add cheese twice as usual and pizza sauce. Select the right page. Double Cheese. Choose your crust. Thick and soft pizza crust, thin crispy pizza crust, Cheesy Max, Extreme cheese crust, Extreme sausage crust.",
      price: 299.00,
      image: "https://www.1112.com/_next/image?url=https%3A%2F%2Fcdn.1112.com%2F1112%2Fpublic%2Fimages%2Fproducts%2Fpizza%2FTopping%2F102216.png&w=640&q=75",
      menuTypeId: 2,
      favorite: true
    ),
    MenuModel( //5
      name: "Spicy Super Seafood",
      detail: "Squid, garlic and pepper shrimp, onion, bell pepper, red chili, green chili, basil, marinara sauce",
      price: 439.00,
      image: "https://www.1112.com/_next/image?url=https%3A%2F%2Fcdn.1112.com%2F1112%2Fpublic%2Fimages%2Fproducts%2Fpizza%2FTopping%2F102734.png&w=640&q=75",
      menuTypeId: 2,
      favorite: false
    ),
    MenuModel( //6
      name: "Chicken Ham Croque Monsieur",
      detail: "White bread with bechamel sauce, chicken ham, cheddar cheese and top with mozzarella cheese.",
      price: 125.00,
      image: "https://www.starbucks.co.th/stb-media/2024/05/Summer2_Chicken-Ham-Croque-Monsieur-copy.jpg",
      menuTypeId: 3,
      favorite: true
    ),
    MenuModel( //7
      name: "Multigrain Chicken Ham and 3 Cheeses",
      detail: "Multigrain read with chicken ham with Emmental cheese, cheddar cheese and gouda cheese.",
      price: 165.00,
      image: "https://www.starbucks.co.th/stb-media/2024/05/Summer2_Multigrain-Chicken-Ham-and-3-Cheese_GBG.jpg",
      menuTypeId: 3,
      favorite: false
    ),
    MenuModel( //8
      name: "Thunder Roll",
      detail: "Come and experience the tenderness of the tuna belly. With super soft foie gras The mellow taste of the spicy miso sauce And sea urchin sauce, many flavors, completely delicious, really finished in one bite. Let's try ordering some.",
      price: 1250.00,
      image: "https://www.shichi.co.th/wp-content/uploads/2021/06/Thunder-Roll.jpg",
      menuTypeId: 4,
      favorite: true
    ),
    MenuModel( //9
      name: "Salmon Skin Maki",
      detail: "This Salmon Skin Roll is made with crunchy salmon skins, crisp cucumber, and creamy crab in Japanese mayo. This delicious dish is sure to impress your family and friends.",
      price: 220.00,
      image: "https://www.shichi.co.th/wp-content/uploads/2021/06/Salmon-Skin-Maki.jpg",
      menuTypeId: 4,
      favorite: false
    ),
    MenuModel( //10
      name: "3 PCS. WINGZ ZABB",
      detail: "No one expected KFC to do their best...well...what did they get, right? But somehow KFC Thailand has managed to decode the best wings. which they call Wingz Zabb' Iyik. It is a cult favorite. It is spicy and has a Thai flavor. Believe me when I say you've never had wings like this. They are quite harsh.",
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