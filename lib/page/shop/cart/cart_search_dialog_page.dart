import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/shop.dart';

class CartSearchDialogPage extends StatelessWidget {
  const CartSearchDialogPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('搜索商品'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (text) => {context.read<Shop>().search(text)},
            autofocus: true,
            decoration: InputDecoration(hintText: "请输入要查询的商品"),
          ),
          // 添加一个搜索结果展示区域
          Expanded(
            child: Consumer<Shop>(
              builder: (context, shop, child) {
                // 根据 shop.state 中的搜索结果来构建 UI
                if (shop.searchList!.isEmpty) {
                  return Center(child: Text('没有找到商品'));
                } else {
                  return SizedBox(
                    height: 200,
                    width: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: shop.searchList?.length ?? 0,
                      itemBuilder: (context, index) {
                        final product = shop.searchList?[index];
                        return ListTile(
                          title: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context, product.name);
                            },
                            child: Text(product!.name.toString()),
                          ),
                          // 其他商品信息展示
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      actions: [
        MaterialButton(
          onPressed:
              () => {
                context.read<Shop>().clearSearchList(),
                Navigator.pop(context),
              },
          color: Theme.of(context).primaryColor,
          child: Text("取消"),
        ),

        /*   MaterialButton(
                onPressed: () => Navigator.pop(context),
                color: Theme.of(context).primaryColor,
                child: Text("确定"),
              ),*/
      ],
    );
  }
}
