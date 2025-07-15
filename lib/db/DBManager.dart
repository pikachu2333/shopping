import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test6_26/models/product.dart';

class DBManager {
  /// 数据库名
  final String _dbName = "dbName";

  /// 数据库版本
  final int _version = 1;

  static final DBManager _instance = DBManager._();

  factory DBManager() {
    return _instance;
  }

  DBManager._();

  static Database? _db;

  Future<Database> get db async {
    // if (_db != null) {
    //   return _db;
    // }
    // _db = await _initDB();
    // return _db;
    return _db ??= await _initDB();
  }

  /// 初始化数据库
  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(
      path,
      version: _version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// 创建表
  Future _onCreate(Database db, int version) async {
    const String sql = '''
    CREATE TABLE Product (
      name TEXT PRIMARY KEY,
      price REAL NOT NULL,
      description TEXT,
      imagePath TEXT
    );
    ''';
    return await db.execute(sql);
  }

  /// 更新表
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  /// 保存数据
  Future saveData(Product product) async {
    Database database = await db;
    return await database.insert("Product", product.toJson());
  }

  /// 使用SQL保存数据
  Future saveDataBySQL(Product product) async {
    const String sql = """
    INSERT INTO Product(name,price,description,imagePath) values(?,?,?,?)
    """;
    Database database = await db;
    return await database.rawInsert(sql, [
      product.name,
      product.price,
      product.description,
      product.imagePath,
    ]);
  }

  /// 查询全部数据
  Future<List<Product>?> findAll() async {
    Database? database = await db;
    List<Map<String, Object?>> result = await database.query("Product");
    if (result.isNotEmpty) {
      return result.map((e) => Product.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  ///条件查询
  Future<List<Product>?> find(String name) async {
    Database database = await db;
    List<Map<String, Object?>> result = await database.query(
      "Product",
      where: "name LIKE ?",
      whereArgs: ["%$name%"],
    );
    if (result.isNotEmpty) {
      return result.map((e) => Product.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<int> update(Product product) async {
    Database database = await db;
    int count = await database.update(
      "Product",
      product.toJson(),
      where: "name=?",
      whereArgs: [product.name],
    );
    return count;
  }

  /// 删除
  Future<int> delete(Product product) async {
    Database database = await db;
    int count = await database.delete(
      "Product",
      where: "name=?",
      whereArgs: [product.name],
    );
    return count;
  }

  /// 删除全部
  Future<int> deleteAll() async {
    Database database = await db;
    int count = await database.delete("Product");
    return count;
  }

  Future<int> insert(Product product) async {
    Database database = await db;
    return await database.insert("Product", product.toJson());
  }
}
