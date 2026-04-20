// ignore_for_file: must_be_immutable

import 'package:cashier_z/core/widgets/custom_app_bar.dart';

import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/cashire_view.dart';

import 'package:cashier_z/core/widgets/select_mode.dart';

import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/mange_products_mode_body.dart';
import 'package:flutter/material.dart';

class CashireModeBody extends StatefulWidget {
  const CashireModeBody({super.key});

  @override
  State<CashireModeBody> createState() => _CashireModeBodyState();
}

class _CashireModeBodyState extends State<CashireModeBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        const SizedBox(height: 10),
        SelectMode(
          selectedIndex: selectedIndex,
          onChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),

        const SizedBox(height: 20),

        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: selectedIndex == 0
                ? CashierView()
                : const MangeProductsModeBody(),
          ),
        ),
      ],
    );
  }
}
