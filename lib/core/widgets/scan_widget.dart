// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:cashier_z/core/widgets/scan_bar_code_field.dart';
import 'package:flutter/material.dart';

class ScanWidget extends StatelessWidget {
  final Function(String value)? onScan;

  const ScanWidget({super.key, this.onScan});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScanBarCodeField(
        onScan: onScan,
      ),
    );
  }
}