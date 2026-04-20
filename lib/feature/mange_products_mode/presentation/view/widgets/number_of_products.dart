import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class NumberOfProduct extends StatelessWidget {
  const NumberOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Text(
            listProduct,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color: colorButtonSelectedTap,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "20",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
