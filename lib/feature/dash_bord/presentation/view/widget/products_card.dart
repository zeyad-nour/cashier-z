import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_info_card.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardInfoCard(
      title: "المنتجات",
      value: "120",
      icon: Icons.inventory_2,
    );
  }
}