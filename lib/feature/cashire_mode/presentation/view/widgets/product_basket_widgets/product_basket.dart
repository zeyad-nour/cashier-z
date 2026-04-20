import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/product_basket_widgets/Purchases.dart';
import 'package:flutter/material.dart';

class ProductBasket extends StatelessWidget {
  const ProductBasket({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: 20,
          itemBuilder: (context, index) {
            return Purchases();
          },
        ),
      ),
    );
  }
}
