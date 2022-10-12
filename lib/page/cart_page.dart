import 'package:flutter/material.dart';
import 'package:flutter_sales/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier Flutter Sales"),
      ),
      body: Column(children: [
        Text(
            "Votre panier contient ${context.watch<CartModel>().lsProduct.length} éléments"),
        Text("Cout total : ${context.watch<CartModel>().getPrice()} €"),
        Consumer<CartModel>(
            builder: (_, cart, __) => Expanded(
                    child: ListView.builder(
                  itemCount: cart.lsProduct.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(cart.lsProduct[index].title),
                    subtitle: Text(cart.lsProduct[index].getPrice()),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () => cart.remove(cart.lsProduct[index]),
                    ),
                    leading: Image.network(
                      cart.lsProduct[index].image,
                      loadingBuilder: (_, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                )))
      ]),
    );
  }
}
