// ignore_for_file: must_be_immutable

import 'package:cashier_z/core/widgets/custom_app_bar.dart';
import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/options_widget.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/select_mode.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/mange_products_mode.dart';
import 'package:flutter/material.dart';


class CashireModeBody extends StatelessWidget {
  const CashireModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),

        SelectMode(
          selectedIndex: 0,
          onChange: (index) {
            if (index == 0) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MangeProductsMode()),
            );
          },
        ),

        const ScanWidget(),
        const OptionsWidget(),
      ],
    );
  }
}