import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';

class CardInfoProducts extends StatelessWidget {
  final ProductModel product;

  const CardInfoProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderAndDivider, width: 1.5),
      ),
      child: Card(
        color: cardsAndContainers,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              product.barcode,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),

            const Spacer(),

            const Divider(),

            Text(
              "${product.price} EGP",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}