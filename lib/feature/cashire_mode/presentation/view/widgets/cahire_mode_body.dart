import 'package:cashier_z/core/widgets/custom_app_bar.dart';
import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/select_mode.dart';
import 'package:flutter/material.dart';

class CahireModeBody extends StatelessWidget {
  const CahireModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom App Bar
        const CustomAppBar(),
        // Select Mode
        const SelectMode(),
        // Scan Widget
        const ScanWidget(),
        OptionsWidget(),
      ],
    );
  }
}
