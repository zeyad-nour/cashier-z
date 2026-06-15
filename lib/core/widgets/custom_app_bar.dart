import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/dash_bord.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.shopping_cart_outlined, color: primaryColor, size: 40),
          Text(
            brandName,
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBord()),
              );
            },
            icon: Icon(
              Icons.admin_panel_settings_outlined,
              color: primaryColor,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
