import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/list_of_products.dart';
import 'package:flutter/material.dart';

class ListProductView extends StatelessWidget {
  const ListProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.start,
          listProduct,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListOfProducts(),
      ],
    );
  }
}
