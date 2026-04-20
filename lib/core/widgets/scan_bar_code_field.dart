// ignore_for_file: deprecated_member_use

import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';


class ScanBarCodeField extends StatelessWidget {
  final Function(String value)? onScan;

  const ScanBarCodeField({super.key, this.onScan});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: (value) {
          if (onScan != null) {
            onScan!(value);
          }
        },
        decoration: InputDecoration(
          hintText: titleFieldScan,
          prefixIcon: const Icon(Icons.qr_code_scanner),
        ),
      ),
    );
  }
}