import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.dashboard, size: 30),

        SizedBox(width: 10),

        Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        Spacer(),

        Chip(label: Text("Today")),
      ],
    );
  }
}
