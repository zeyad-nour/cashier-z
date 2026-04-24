import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/invoice_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashierView extends StatefulWidget {
  const CashierView({super.key});

  @override
  State<CashierView> createState() => _CashierViewState();
}

class _CashierViewState extends State<CashierView> {
  bool enableFocus = true;

  Future<void> handlePrint(BuildContext context) async {
    /// ❌ وقف الفوكس
    setState(() => enableFocus = false);

    FocusScope.of(context).unfocus();

    await Future.delayed(const Duration(milliseconds: 200));

    /// 🖨️ اطبع
    await context.read<ReceiptCubit>().printReceiptPdf();

    /// ✅ رجّع الفوكس
    setState(() => enableFocus = true);
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

        const Expanded(
          child: SingleChildScrollView(
            child: OptionsWidget(),
          ),
        ),

        const SizedBox(height: 10),

        InvoiceWidget(
          onPrint: () => handlePrint(context), // 👈 الجديد
        ),
      ],
    );
  }
}
