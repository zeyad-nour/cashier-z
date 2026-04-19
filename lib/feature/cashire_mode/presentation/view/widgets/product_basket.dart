import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state_mangement/shopping_basket/card_cubit.dart';
import 'purchases.dart';

class ProductBasket extends StatelessWidget {
  const ProductBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCubit, CardState>(
      builder: (context, state) {
        if (state is CardLoaded) {
          final cart = state.products;

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
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return Purchases(product: cart[index]);
                },
              ),
            ),
          );
        }

        return const Center(child: Text("Basket is empty"));
      },
    );
  }
}
