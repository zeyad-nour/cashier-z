import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/list_product_view.dart';

import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/product_basket_view.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [ListProductView(), Spacer(), ProductBasketView()]);
  }
}
