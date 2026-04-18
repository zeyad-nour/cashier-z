import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/list_of_products.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              textAlign: TextAlign.start,
              listProduct,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListOfProducts(),
          ],
        ),
        Spacer(),
        Text(
          'Options',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
