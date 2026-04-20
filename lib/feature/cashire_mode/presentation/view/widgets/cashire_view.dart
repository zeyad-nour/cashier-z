import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:flutter/material.dart';

class CashierView extends StatelessWidget {
  const CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(0),
      children:  [
        ScanWidget(
          onScan: (barcode) {
            // context.read<CardCubit>().scanProduct(barcode);
          },
        ),
        OptionsWidget(),
      ],
    );
  }
}
