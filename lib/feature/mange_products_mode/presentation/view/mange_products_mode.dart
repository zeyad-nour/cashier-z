import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/mange_products_mode_body.dart';
import 'package:flutter/material.dart';

class MangeProductsMode extends StatelessWidget {
  const MangeProductsMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: MangeProductsModeBody(),
    );
  }
}
