// ignore_for_file: deprecated_member_use

import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/core/widgets/scan_bar_code_field.dart';
import 'package:flutter/material.dart';

class ScanWidget extends StatelessWidget {
  const ScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.0999,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.09999),
          border: Border.all(
            width: 0,
            color: primaryColor.withOpacity(0.09999),
          ),
        ),
        child: const Center(child: ScanBarCodeField()),
      ),
    );
  }
}
