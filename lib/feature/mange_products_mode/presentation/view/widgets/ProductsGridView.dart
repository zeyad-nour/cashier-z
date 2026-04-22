// ignore_for_file: file_names

import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/card_info_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangeProductsCubit, MangeProductsState>(
      builder: (context, state) {
        List products = [];

        if (state is ProductsLoaded) {
          products = state.products;
        }

        if (products.isEmpty) {
          return const Center(child: Text("No Products Yet"));
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: products.length, // 👈 مهم جدًا
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.9998,
          ),
          itemBuilder: (context, index) {
            return CardInfoProducts(product: products[index]);
          },
        );
      },
    );
  }
}
