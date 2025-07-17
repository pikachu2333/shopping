import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test6_26/components/my_drawer.dart';
import 'package:test6_26/components/my_product_tile.dart';
import 'package:test6_26/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('购物'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),

          Center(
            child: Text(
              '热门商品',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
