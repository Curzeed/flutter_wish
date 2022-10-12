import 'package:flutter/material.dart';
import 'package:flutter_sales/cart_model.dart';
import 'package:flutter_sales/product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListBuilderWidget extends StatelessWidget {
  final List<Product> lsProducts;

  const ListBuilderWidget(this.lsProducts, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lsProducts.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => context.push('/detail', extra: lsProducts[index]),
              child: ListTile(
                title: Text(lsProducts[index].title),
                subtitle: Text("${lsProducts[index].price}"),
                leading: Hero(
                  tag: lsProducts[index].id,
                  child: Image.network(
                    lsProducts[index].image,
                    loadingBuilder: (context, child, loadingProgress){
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                trailing: TextButton(
                  onPressed: () => context.read<CartModel>().add(lsProducts[index]),
                  child: const Text("Ajouter"),
                ),

              ));
        });
  }
}
