import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import '../product_model.dart';
import 'package:flutter_sales/listBuilderWidget.dart';

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ListProduct"), actions: [
          IconButton(
              onPressed: () => context.go('/cart'),
              icon: const Icon(Icons.shopping_cart))
        ]),
        body: FutureBuilder<http.Response>(
            future: http.get(Uri.parse("https://fakestoreapi.com/products/")),
            builder: (_, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                String body = snapshot.data!.body;
                List<Product> lsProducts = (jsonDecode(body) as List)
                    .map((e) => Product.fromJson(e))
                    .toList();
                return ListBuilderWidget(lsProducts);
              }
              return const CircularProgressIndicator();
            }));
  }
}
