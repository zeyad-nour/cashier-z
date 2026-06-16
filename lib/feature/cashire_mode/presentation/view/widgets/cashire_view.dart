// ignore_for_file: use_build_context_synchronously

import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/invoice_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_cubit.dart';
import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashierView extends StatefulWidget {
  const CashierView({super.key});

  @override
  State<CashierView> createState() => _CashierViewState();
}

class _CashierViewState extends State<CashierView> {
  bool enableFocus = true;
  bool _isPrinting = false;

  Future<void> handlePrint(BuildContext context) async {
    if (_isPrinting) return;

    _isPrinting = true;

    setState(() => enableFocus = false);

    await context.read<ReceiptCubit>().printReceiptPdf(context);

    await context.read<DashboardCubit>().loadDashboard();

    setState(() => enableFocus = true);

    _isPrinting = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        ScanWidget(
          enableAutoFocus: enableFocus,
          onScan: (barcode) {
            context.read<ReceiptCubit>().scan(barcode);
          },
        ),

        const SizedBox(height: 20),

        const Expanded(child: SingleChildScrollView(child: OptionsWidget())),

        const SizedBox(height: 10),

        InvoiceWidget(onPrint: () => handlePrint(context)),
      ],
    );
  }
}
