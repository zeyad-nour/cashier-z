import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:flutter/material.dart';

class MangeProductsView extends StatelessWidget {
  const MangeProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(0),
      children: const [ScanWidget(), OptionsWidget()],
    );
  }
}
