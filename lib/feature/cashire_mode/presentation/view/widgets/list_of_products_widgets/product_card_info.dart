// ignore_for_file: deprecated_member_use

import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardInfo extends StatelessWidget {
  final ProductModel product;

  const ProductCardInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: product.quantity > 10
            ? cardsAndContainers
            : Colors.red.withOpacity(0.8),
        child: ListTile(
          title: Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryTextColor,
            ),
          ),

          subtitle: Text(
            product.barcode,
            style: const TextStyle(fontSize: 14, color: secounderyTextColor),
          ),

          trailing: Text(
            "${product.price} EGP",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryColor,
            ),
          ),
          leading: Text(
            product.quantity.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
