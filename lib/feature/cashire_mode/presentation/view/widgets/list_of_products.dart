import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/product_cubit/product_cubit_cubit.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/product_cubit/product_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'product_card_info.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductCubitState>(
      builder: (context, state) {

        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductLoaded) {
          final products = state.products;

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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCardInfo(product: product);
                },
              ),
            ),
          );
        }

        if (state is ProductError) {
          return Center(child: Text(state.message));
        }

        return const SizedBox();
      },
    );
  }
}