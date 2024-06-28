// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MenuDao? _menuDAOInstance;

  MenuTypeDao? _menuTypeDAOInstance;

  MenuDetailDao? _menuDetailDaoInstance;

  MenuFavoriteDao? _menuFavoriteDaoInstance;

  CartItemDao? _cartItemDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `menu` (`id` INTEGER, `name` TEXT, `detail` TEXT, `price` REAL, `image` TEXT, `menuTypeId` INTEGER, `favorite` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `menu_type` (`id` INTEGER, `type` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `menu` (`id` INTEGER, `name` TEXT, `detail` TEXT, `price` REAL, `image` TEXT, `menuTypeId` INTEGER, `favorite` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `menu` (`id` INTEGER, `name` TEXT, `detail` TEXT, `price` REAL, `image` TEXT, `menuTypeId` INTEGER, `favorite` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `menu` (`id` INTEGER, `name` TEXT, `detail` TEXT, `price` REAL, `image` TEXT, `menuTypeId` INTEGER, `favorite` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cart_item` (`id` INTEGER, `menuId` INTEGER, `quantity` INTEGER, FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cart_item` (`id` INTEGER, `menuId` INTEGER, `quantity` INTEGER, `name` TEXT, `detail` TEXT, `price` REAL, `image` TEXT, `menuTypeId` INTEGER, `favorite` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MenuDao get menuDAO {
    return _menuDAOInstance ??= _$MenuDao(database, changeListener);
  }

  @override
  MenuTypeDao get menuTypeDAO {
    return _menuTypeDAOInstance ??= _$MenuTypeDao(database, changeListener);
  }

  @override
  MenuDetailDao get menuDetailDao {
    return _menuDetailDaoInstance ??= _$MenuDetailDao(database, changeListener);
  }

  @override
  MenuFavoriteDao get menuFavoriteDao {
    return _menuFavoriteDaoInstance ??=
        _$MenuFavoriteDao(database, changeListener);
  }

  @override
  CartItemDao get cartItemDao {
    return _cartItemDaoInstance ??= _$CartItemDao(database, changeListener);
  }
}

class _$MenuDao extends MenuDao {
  _$MenuDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _menuEntityInsertionAdapter = InsertionAdapter(
            database,
            'menu',
            (MenuEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'detail': item.detail,
                  'price': item.price,
                  'image': item.image,
                  'menuTypeId': item.menuTypeId,
                  'favorite':
                      item.favorite == null ? null : (item.favorite! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MenuEntity> _menuEntityInsertionAdapter;

  @override
  Future<List<MenuEntity>> getAllMenu() async {
    return _queryAdapter.queryList('SELECT * FROM menu',
        mapper: (Map<String, Object?> row) => MenuEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite: row['favorite'] == null
                ? null
                : (row['favorite'] as int) != 0));
  }

  @override
  Future<List<MenuEntity>> getMenuByMenuType(int menuTypeId) async {
    return _queryAdapter.queryList('SELECT * FROM menu WHERE menuTypeId = ?1',
        mapper: (Map<String, Object?> row) => MenuEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite:
                row['favorite'] == null ? null : (row['favorite'] as int) != 0),
        arguments: [menuTypeId]);
  }

  @override
  Future<List<MenuEntity>> getSearchMenu(String strSearch) async {
    return _queryAdapter.queryList('SELECT * FROM menu WHERE name LIKE \'?1\'',
        mapper: (Map<String, Object?> row) => MenuEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite:
                row['favorite'] == null ? null : (row['favorite'] as int) != 0),
        arguments: [strSearch]);
  }

  @override
  Future<List<MenuEntity>> getSearchMenuByMenuType(
    int menuTypeId,
    String strSearch,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM menu WHERE menuTypeId = ?1 AND name LIKE ?2',
        mapper: (Map<String, Object?> row) => MenuEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite:
                row['favorite'] == null ? null : (row['favorite'] as int) != 0),
        arguments: [menuTypeId, strSearch]);
  }

  @override
  Future<void> insertMenu(MenuEntity menu) async {
    await _menuEntityInsertionAdapter.insert(menu, OnConflictStrategy.abort);
  }
}

class _$MenuTypeDao extends MenuTypeDao {
  _$MenuTypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _menuTypeEntityInsertionAdapter = InsertionAdapter(
            database,
            'menu_type',
            (MenuTypeEntity item) =>
                <String, Object?>{'id': item.id, 'type': item.type});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MenuTypeEntity> _menuTypeEntityInsertionAdapter;

  @override
  Future<List<MenuTypeEntity>> getAllMenuType() async {
    return _queryAdapter.queryList('SELECT * FROM menu_type',
        mapper: (Map<String, Object?> row) => MenuTypeEntity(
            id: row['id'] as int?, type: row['type'] as String?));
  }

  @override
  Future<void> insertMenuType(MenuTypeEntity menuTypeModel) async {
    await _menuTypeEntityInsertionAdapter.insert(
        menuTypeModel, OnConflictStrategy.abort);
  }
}

class _$MenuDetailDao extends MenuDetailDao {
  _$MenuDetailDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<MenuDetailEntity?> getMenuDetail(int menuId) async {
    return _queryAdapter.query('SELECT * FROM menu WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MenuDetailEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite:
                row['favorite'] == null ? null : (row['favorite'] as int) != 0),
        arguments: [menuId]);
  }

  @override
  Future<void> updateFavoriteMenuDetail(
    bool isFavorite,
    int menuId,
  ) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE menu SET favorite = ?1 WHERE  id = ?2',
        arguments: [isFavorite ? 1 : 0, menuId]);
  }
}

class _$MenuFavoriteDao extends MenuFavoriteDao {
  _$MenuFavoriteDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<MenuFavoriteEntity>> getMenuFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM  menu WHERE favorite = 1',
        mapper: (Map<String, Object?> row) => MenuFavoriteEntity(
            id: row['id'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite: row['favorite'] == null
                ? null
                : (row['favorite'] as int) != 0));
  }
}

class _$CartItemDao extends CartItemDao {
  _$CartItemDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<CartEntity>?> getCartAll() async {
    return _queryAdapter.queryList(
        'SELECT       cart_item.id ,       cart_item.menuId,       cart_item.quantity,       menu.name,       menu.detail,       menu.image,       menu.menuTypeId,       menu.favorite       FROM       cart_item       INNER JOIN       menu on cart_item.menuId = menu.id',
        mapper: (Map<String, Object?> row) => CartEntity(
            id: row['id'] as int?,
            menuId: row['menuId'] as int?,
            quantity: row['quantity'] as int?,
            name: row['name'] as String?,
            detail: row['detail'] as String?,
            price: row['price'] as double?,
            image: row['image'] as String?,
            menuTypeId: row['menuTypeId'] as int?,
            favorite: row['favorite'] == null
                ? null
                : (row['favorite'] as int) != 0));
  }

  @override
  Future<List<CartItemEntity>?> getCartItemById(int menuId) async {
    return _queryAdapter.queryList(
        'SELECT cart_item.menuId FROM cart_item WHERE menuId = ?1',
        mapper: (Map<String, Object?> row) => CartItemEntity(
            id: row['id'] as int?,
            menuId: row['menuId'] as int?,
            quantity: row['quantity'] as int?),
        arguments: [menuId]);
  }

  @override
  Future<void> insertCartItem(
    int menuId,
    int quantity,
  ) async {
    await _queryAdapter.queryNoReturn(
        'INSERT INTO cart_item (menuId, quantity) VALUES (?1, ?2)',
        arguments: [menuId, quantity]);
  }
}
