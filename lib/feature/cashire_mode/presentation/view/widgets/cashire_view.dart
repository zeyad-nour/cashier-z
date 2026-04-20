import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/invoice_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:flutter/material.dart';

class CashierView extends StatelessWidget {
  const CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(0),
      children: [
        const SizedBox(height: 20),

        // الجزء اللي فوق
        Expanded(
          child: Column(
            children: [
              ScanWidget(onScan: (barcode) {}),
              const SizedBox(height: 20),
              OptionsWidget(),
            ],
          ),
        ),

        const SizedBox(height: 10),

        //  الفاتورة
        const InvoiceWidget(),
      ],
    );
  }
}
