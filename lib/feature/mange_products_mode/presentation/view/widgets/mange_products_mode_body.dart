import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/ProductsGridView.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/add_or_update_product_dialog_widget.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/number_of_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MangeProductsModeBody extends StatelessWidget {
  const MangeProductsModeBody({super.key});

  @override
  Widget build(BuildContext context) {
  return BlocListener<MangeProductsCubit, MangeProductsState>(
  listener: (context, state) {
    if (state is ProductNotFound) {
      showDialog(
        context: context,
        builder: (_) => AddOrUpdateProductDialog(
          barcode: state.barcode,
          isUpdate: false,
          onSubmit: (name, price) {
            context.read<MangeProductsCubit>().addProduct(
                  name: name,
                  barcode: state.barcode,
                  price: price,
                );
          },
        ),
      );
    }

    if (state is ProductFound) {
      showDialog(
        context: context,
        builder: (_) => AddOrUpdateProductDialog(
          barcode: state.product.barcode,
          name: state.product.name,
          price: state.product.price,
          isUpdate: true,
          onSubmit: (_, price) {
            context.read<MangeProductsCubit>().updatePrice(
                  barcode: state.product.barcode,
                  newPrice: price,
                );
          },
        ),
      );
    }
  },
  child: Column(
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
  ),
);
  }
}
