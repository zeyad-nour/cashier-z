import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductCardInfo extends StatelessWidget {
  const ProductCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: cardsAndContainers,
        child: ListTile(
          title: Text(
            "product Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryTextColor,
            ),
          ),

          subtitle: Text(
            "serail Number",
            style: TextStyle(fontSize: 14, color: secounderyTextColor),
          ),

          trailing: Text(
            "price",
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
