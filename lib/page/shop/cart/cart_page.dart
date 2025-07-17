import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test6_26/components/my_button.dart';
import 'package:test6_26/models/product.dart';
import 'package:test6_26/models/shop.dart';

import 'cart_search_dialog_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ///搜索的名称回调
  String searchName = "";
  void removeItemCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("是否从购物车删除"),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<Shop>().deleteData(product);
                },
                child: Text("Yes"),
              ),
            ],
          ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text("链接后端")),
    );
  }

  void searchButtonPressed(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => CartSearchDialogPage(),
    );
    searchName = result ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<Shop>().loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cart = context.watch<Shop>().productList;
    final search = context.read<Shop>().searchList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("购物车"),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => searchButtonPressed(context),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:
                cart!.isEmpty
                    ? Center(child: Text("你的购物车是空的"))
                    : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        final cartname = cart[index].name;
                        final isInCart = searchName == cartname;
                        return ListTile(
                          title: Text(
                            item.name,
                            style: TextStyle(
                              color:
                                  (isInCart ?? false)
                                      ? Colors.yellow
                                      : Colors.black,
                            ),
                          ),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            onPressed: () => removeItemCart(context, item),
                            icon: Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: SizedBox(
                width: 300,
                height: 30,
                child: Center(
                  child: Text("结算", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
