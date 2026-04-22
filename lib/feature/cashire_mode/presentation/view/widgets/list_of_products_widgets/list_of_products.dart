import 'package:cashier_z/feature/mange_products_mode/data/local/hive_helper.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'product_card_info.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final box = HiveHelper.getBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<ProductModel> box, _) {
            final products = box.values.toList();

            if (products.isEmpty) {
              return const Center(child: Text("No Products"));
            }

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCardInfo(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}