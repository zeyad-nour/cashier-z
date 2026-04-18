import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).height * 0.5,
        decoration: BoxDecoration(
          color: cardsAndContainers,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderAndDivider, width: 1.6),
        ),
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ProductCardInfo(index: index);
          },
        ),
      ),
    );
  }
}

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
