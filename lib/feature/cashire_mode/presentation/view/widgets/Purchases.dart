// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state_mangement/shopping_basket/card_cubit.dart';

class Purchases extends StatelessWidget {
  final CartItem product;

  const Purchases({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.product.name),

        subtitle: Text(product.product.barcode),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// 🔽 decrease
            IconButton(
              onPressed: () {
                context
                    .read<CardCubit>()
                    .decrease(product.product.barcode);
              },
              icon: const Icon(Icons.remove),
            ),

            /// quantity
            Text(
              product.quantity.toString(),
              style: const TextStyle(fontSize: 16),
            ),

            /// 🔼 increase
            IconButton(
              onPressed: () {
                context
                    .read<CardCubit>()
                    .increase(product.product.barcode);
              },
              icon: const Icon(Icons.add),
            ),

            /// 💰 price
            Text(
              "${product.product.price * product.quantity}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}