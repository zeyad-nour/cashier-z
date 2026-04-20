import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/core/widgets/scan_widget.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/number_of_products.dart';

import 'package:flutter/material.dart';

class MangeProductsModeBody extends StatelessWidget {
  const MangeProductsModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(1),
      children: [
        ScanWidget(onScan: (barcode) {}),
        SizedBox(height: 20),
        NumberOfProduct(),
      ],
    );
  }
}

