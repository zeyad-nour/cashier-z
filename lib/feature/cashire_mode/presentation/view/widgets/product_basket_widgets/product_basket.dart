import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_cubit.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_state.dart';
import 'package:cashier_z/core/utils/colors.dart';

import 'purchases.dart';

class ProductBasket extends StatelessWidget {
  const ProductBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptCubit, ReceiptState>(
      builder: (context, state) {
        final items = state.items;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: MediaQuery.sizeOf(context).height * 0.5,
            decoration: BoxDecoration(
              color: cardsAndContainers,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderAndDivider, width: 1.6),
            ),
            child: items.isEmpty
                ? const Center(child: Text(noProducts))
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Purchases(
                        item: items[index],
                        index: index,
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}