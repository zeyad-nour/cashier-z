import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfProduct extends StatelessWidget {
  const NumberOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangeProductsCubit, MangeProductsState>(
      builder: (context, state) {
        int count = 0;

        if (state is ProductsLoaded) {
          count = state.products.length;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Text(
                listProduct,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: colorButtonSelectedTap,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "$count",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}