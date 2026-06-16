import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(Icons.dashboard_outlined, size: 45, color: primaryColor),
          const SizedBox(width: 10),
          Text(
            "Dash Bord",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
