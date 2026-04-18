
import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductCardInfo extends StatelessWidget {
  final int index;
  const ProductCardInfo({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: cardsAndContainers,
        child: ListTile(
          title: Text(
            'Product ${index + 1}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryTextColor,
            ),
          ), //name
          subtitle: Text(
            'Description of product ${index + 1}',
            style: TextStyle(fontSize: 14, color: secounderyTextColor),
          ), //seireal number
          trailing: Text(
            '\$${(index + 1) * 10}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryColor,
            ),
          ), //price
        ),
      ),
    );
  }
}
