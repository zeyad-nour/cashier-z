import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_cards.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_header.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/low_stock_list.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/recent_invoices.dart';
import 'package:flutter/material.dart';


class DashBordBody extends StatelessWidget {
  const DashBordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          DashboardHeader(),

          SizedBox(height: 20),

          DashboardCards(),

          SizedBox(height: 20),

          LowStockList(),

          SizedBox(height: 20),

          RecentInvoicesList(),
        ],
      ),
    );
  }
}