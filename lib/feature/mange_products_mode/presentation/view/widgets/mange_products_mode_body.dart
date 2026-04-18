import 'package:cashier_z/core/widgets/custom_app_bar.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/cashire_mode.dart';
import 'package:cashier_z/core/widgets/select_mode.dart';
import 'package:flutter/material.dart';

class MangeProductsModeBody extends StatelessWidget {
  const MangeProductsModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),

        SelectMode(
          selectedIndex: 1,
          onChange: (index) {
            if (index == 1) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => CashireMode()),
            );
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
