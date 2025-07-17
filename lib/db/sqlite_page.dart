import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test6_26/models/shop.dart';

import 'add_product_page.dart';

class SqlitePage extends StatelessWidget {
  const SqlitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddProductPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<Shop>().loadAllData();
                },
                child: const Text("查询所有数据"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<Shop>().loadData("1");
                },
                child: const Text("条件查询"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<Shop>().deleteAllData();
                },
                child: const Text("删除全部"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: _buildTable(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 使用 Consumer 来监听 ProductProvider 的变化
  _buildTable(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, Shop, child) {
        return Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            const TableRow(
              children: [
                TableCell(child: Text("商品名称")),
                TableCell(child: Text("价格")),
                TableCell(child: Text("描述")),
                TableCell(child: Text("图片路径")),
                TableCell(child: Text("修改")),
                TableCell(child: Text("删除")),
              ],
            ),
            ...?Shop.productList
                ?.map(
                  (e) => TableRow(
                    children: [
                      TableCell(child: Text(e.name)),
                      TableCell(child: Text("${e.price}")),
                      TableCell(child: Text(e.description)),
                      TableCell(child: Text(e.imagePath)),
                      TableCell(
                        child: TextButton(
                          onPressed: () {
                            Shop.updateData(e);
                          },
                          child: const Text("修改"),
                        ),
                      ),
                      TableCell(
                        child: TextButton(
                          onPressed: () {
                            Shop.deleteData(e);
                          },
                          child: const Text("删除"),
                        ),
                      ),
                    ],
                  ),
                )
                ,
          ],
        );
      },
    );
  }
}
