import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test6_26/models/shop.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("增加产品")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Shop>(
          builder: (context, Shop, child) {
            return Column(
              children: [
                TextField(
                  onChanged: (text) {
                    Shop.updateName(text);
                  },
                  decoration: const InputDecoration(labelText: "产品名称："),
                ),
                TextField(
                  onChanged: (text) {
                    Shop.updatePrice(
                      double.tryParse(text) ?? 0.0,
                    );
                  },
                  decoration: const InputDecoration(labelText: "产品价格："),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                TextField(
                  onChanged: (text) {
                    Shop.updateDescription(text);
                  },
                  decoration: const InputDecoration(labelText: "产品描述："),
                ),
                TextField(
                  onChanged: (text) {
                    Shop.updateImagePath(text);
                  },
                  decoration: const InputDecoration(labelText: "图片路径："),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Shop.saveProduct();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('保存数据成功')));
                  },
                  child: const Text("保存数据"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Shop.saveProductBySQL();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('保存数据成功')));
                  },
                  child: const Text("使用SQL保存数据"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
