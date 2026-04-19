import 'package:cashier_z/core/widgets/scan_widget.dart';

import 'package:flutter/material.dart';

class MangeProductsModeBody extends StatelessWidget {
  const MangeProductsModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(key: const ValueKey(1), children: const [ScanWidget()]);
  }
}
