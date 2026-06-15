import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_info_card.dart';
import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardInfoCard(
      title: "Today's Sales",
      value: "3250 EGP",
      icon: Icons.attach_money,
    );
  }
}