// ignore_for_file: file_names

import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/card_info_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatelessWidget {
  // final List<Map<String, dynamic>> products;

  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangeProductsCubit, MangeProductsState>(
      builder: (context, state) {
        List products = [];

        if (state is ProductsLoaded) {
          products = state.products;
        }
       return GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 👈 3 في الصف
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // 👈 شكل الكارت
          ),
          itemBuilder: (context, index) {
            // final product = products[index];

            return CardInfoProducts(product: products[index],);
          },
        );
      },
    );
  
  }
}
