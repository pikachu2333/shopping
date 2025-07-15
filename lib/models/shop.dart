import 'package:flutter/cupertino.dart';
import 'package:test6_26/models/product.dart';

import '../db/DBManager.dart';


class Shop extends ChangeNotifier{

  final List<Product> _shop = [
    Product(name: 'Product1', price: 100, description: "item,description", imagePath: 'lib/img/img_1.png'),
    Product(name: 'Product2', price: 200, description: "item,description", imagePath: 'lib/img/img_2.png',),
    Product(name: 'Product3', price: 300, description: "item,description", imagePath: 'lib/img/img_3.png'),
    Product(name: 'Product4', price: 400, description: "item,description", imagePath: 'lib/img/img_1.png'),
  ];
  String _name = '';
  double _price = 0.0;
  String _description = '';
  String _imagePath = '';
  List<Product> _cart = [];
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  List<Product>? _productList = [];
  List<Product>? get productList => _productList;
  List<Product>? _searchList = [];
  List<Product>? get searchList => _searchList;
  String get name => _name;
  double get price => _price;
  String get description => _description;
  String get imagePath => _imagePath;


// 向购物车中添加商品
  void addToCart(Product product) {
    // 将商品添加到购物车
    _cart.add(product);
   // 通知监听器
   notifyListeners();
  }
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
  void clearFromCart(Product product) {
    _cart.clear();
    notifyListeners();
  }

  //----------------------//----------------------//
  // 添加商品到数据库
  addData(Product product) async {
    var count = await DBManager().insert(product);
    notifyListeners();
    if (count > 0) {
      loadAllData();  // 更新数据
      return "添加成功";
      } else {
      return "添加失败";
      }
    }
    // 搜索商品
    search(String name) async {
      _searchList = await DBManager().find(name);
      notifyListeners();
    }
    //清除所有搜索列表商品
    clearSearchList() {
      _searchList = [];
      notifyListeners();
      }


  // 加载所有数据
  loadAllData() async {
    _productList = await DBManager().findAll();
    notifyListeners();
  }

  // 根据条件加载数据
  loadData(String name) async {
    _productList = await DBManager().find(name);
    notifyListeners();
  }

  // 更新数据
  updateData(Product product) async {
    var count = await DBManager().update(product);
    if (count > 0) {
      loadAllData();  // 更新数据
      return "修改成功";
    } else {
      return "修改失败";
    }
  }

  // 删除数据
  deleteData(Product product) async {
    var count = await DBManager().delete(product);
    if (count > 0) {
      loadAllData();  // 更新数据
      return "删除成功";
    } else {
      return "删除失败";
    }
  }

  // 删除所有数据
  deleteAllData() async {
    var count = await DBManager().deleteAll();
    if (count > 0) {
      loadAllData();  // 更新数据
      return "删除成功";
    } else {
      return "删除失败";
    }
  }
  //-------------------//----------------------//
  void updateName(String name) {
    _name = name;
    notifyListeners();
  }

  void updatePrice(double price) {
    _price = price;
    notifyListeners();
  }

  void updateDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void updateImagePath(String imagePath) {
    _imagePath = imagePath;
    notifyListeners();
  }

  Future<void> saveProduct() async {
    var product = Product(
      name: _name,
      price: _price,
      description: _description,
      imagePath: _imagePath,
    );
    int result = await DBManager().saveData(product);
    if (result > 0) {
      print('Product saved successfully');
    } else {
      print('Failed to save product');
    }
  }

  Future<void> saveProductBySQL() async {
    var product = Product(
      name: _name,
      price: _price,
      description: _description,
      imagePath: _imagePath,
    );
    int result = await DBManager().saveDataBySQL(product);
    if (result > 0) {
      print('Product saved successfully');
    } else {
      print('Failed to save product');
    }
  }
}

