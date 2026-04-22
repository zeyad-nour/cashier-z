// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_cubit.dart';

class Purchases extends StatelessWidget {
  final CartItem item;
  final int index;

  const Purchases({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReceiptCubit>();

    return Card(
      child: ListTile(
        title: Text(item.product.name),

        subtitle: Text(item.product.barcode),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 🔽 decrease
            IconButton(
              onPressed: () {
                cubit.decrease(index);
              },
              icon: const Icon(Icons.remove),
            ),

            /// quantity
            Text(
              "${item.quantity}",
              style: const TextStyle(fontSize: 16),
            ),

            /// 🔼 increase
            IconButton(
              onPressed: () {
                cubit.increase(index);
              },
              icon: const Icon(Icons.add),
            ),

            const SizedBox(width: 10),

            /// 💰 price
            Text(
              "${item.total} EGP",
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