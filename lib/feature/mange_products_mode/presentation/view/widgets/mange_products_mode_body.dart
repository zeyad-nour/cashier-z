import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/ProductsGridView.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/number_of_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MangeProductsModeBody extends StatelessWidget {
  const MangeProductsModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(1),
      children: [
        ScanWidget(
          onScan: (barcode) {
            context.read<MangeProductsCubit>().scanBarcode(barcode);
          },
        ),

        const SizedBox(height: 20),

        const NumberOfProduct(),

        const Expanded(child: ProductsGridView()),
      ],
    );
  }
}
