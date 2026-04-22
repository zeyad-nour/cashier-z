import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/invoice_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashierView extends StatelessWidget {
  const CashierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        ScanWidget(
          onScan: (barcode) {
            context.read<ReceiptCubit>().scan(barcode);
          },
        ),

        const SizedBox(height: 20),

        // 👇 أهم تعديل هنا
        const Expanded(child: SingleChildScrollView(child: OptionsWidget())),

        const SizedBox(height: 10),

        const InvoiceWidget(),
      ],
    );
  }
}
