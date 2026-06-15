import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_info_card.dart';
import 'package:flutter/material.dart';

class InvoicesCard extends StatelessWidget {
  const InvoicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardInfoCard(
      title: "الفواتير",
      value: "15",
      icon: Icons.receipt_long,
    );
  }
}