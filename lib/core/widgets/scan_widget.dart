import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ScanWidget extends StatelessWidget {
  const ScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.0999,
        decoration: BoxDecoration(
          color: colorButtonSelectedTap,
          borderRadius: BorderRadius.circular(0),
        ),
        child: const Center(
          child: Text(
            'Scan',
            style: TextStyle(
              color: cardsAndContainers,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
