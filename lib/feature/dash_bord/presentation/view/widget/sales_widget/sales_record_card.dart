import 'package:cashier_z/feature/dash_bord/presentation/view/widget/sales_widget/sales_record_item.dart';
import 'package:flutter/material.dart';

class SalesRecordCard extends StatelessWidget {
  final String date;
  final double totalSales;
  final int invoicesCount;

  const SalesRecordCard({
    super.key,
    required this.date,
    required this.totalSales,
    required this.invoicesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(height: 30),

            SalesRecordItem(
              title: "المبيعات",
              value: totalSales.toStringAsFixed(0),
            ),

            const SizedBox(height: 12),

            SalesRecordItem(
              title: "الفواتير",
              value: invoicesCount.toString(),
            ),
          ],
        ),
      ),
    );
  }
}