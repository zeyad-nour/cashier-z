import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/list_of_products_widgets/list_product_view.dart';

import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/product_basket_widgets/product_basket_view.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ListProductView()),
        const SizedBox(width: 10),
        Expanded(child: ProductBasketView()),
      ],
    );
  }
}