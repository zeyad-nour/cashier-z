// ignore_for_file: deprecated_member_use

import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';


class ScanBarCodeField extends StatefulWidget {
  final Function(String value)? onScan;

  const ScanBarCodeField({super.key, this.onScan});

  @override
  State<ScanBarCodeField> createState() => _ScanBarCodeFieldState();
}

class _ScanBarCodeFieldState extends State<ScanBarCodeField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: (value) {
          widget.onScan?.call(value);
          controller.clear(); // مهم للكاشير
        },
        decoration: const InputDecoration(
          hintText: "Scan or enter barcode",
          prefixIcon: Icon(Icons.qr_code_scanner),
        ),
      ),
    );
  }
}