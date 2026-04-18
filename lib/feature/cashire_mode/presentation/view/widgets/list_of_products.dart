import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      height: MediaQuery.sizeOf(context).height * 0.5,
      color: cardsAndContainers,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCardInfo(index: index);
        },
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
          title: Text('Product ${index + 1}'), //name
          subtitle: Text(
            'Description of product ${index + 1}',
          ), //seireal number
          trailing: Text('\$${(index + 1) * 10}'), //price
        ),
      ),
    );
  }
}
