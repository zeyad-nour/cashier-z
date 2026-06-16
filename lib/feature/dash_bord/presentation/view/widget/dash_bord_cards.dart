import 'package:cashier_z/feature/dash_bord/presentation/view/widget/invoices_card.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/low_stock_list.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/products_card.dart';
import 'package:flutter/material.dart';

import 'sales_card.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        const SalesCard(),
        InvoicesCard(),
        ProductsCard(),
        LowStockList(),
      ],
    );
  }
}
