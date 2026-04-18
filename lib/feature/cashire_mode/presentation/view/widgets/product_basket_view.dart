import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/product_basket.dart';
import 'package:flutter/material.dart';

class ProductBasketView extends StatelessWidget {
  const ProductBasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          productBasket,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ProductBasket(),
      ],
    );
  }
}
