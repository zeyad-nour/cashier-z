import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/core/widgets/mode_button.dart';
import 'package:flutter/material.dart';

class SelectMode extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChange;

  const SelectMode({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ModeButton(
            title: cashireMode,
            icon: Icons.shopping_cart_outlined,
            isSelected: selectedIndex == 0,
            onTap: () => onChange(0),
          ),
          ModeButton(
            title: mangeProductsMode,
            icon: Icons.inventory_2_outlined,
            isSelected: selectedIndex == 1,
            onTap: () => onChange(1),
          ),
        ],
      ),
    );
  }
}
