import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ScanBarCodeField extends StatelessWidget {
  const ScanBarCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.08,

      child: TextFormField(
        decoration: InputDecoration(
          fillColor: primaryLight,
          filled: true,
          hint: Center(
            child: Text(
              titleFieldScan,
              style: const TextStyle(fontSize: 18, color: secounderyTextColor),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.099)),
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),

          prefixIcon: const Icon(Icons.qr_code_scanner, color: primaryColor),
        ),
      ),
    );
  }
}
