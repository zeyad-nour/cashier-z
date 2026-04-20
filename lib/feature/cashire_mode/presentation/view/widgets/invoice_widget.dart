import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 mock data مؤقت
    double totalPrice = 150.75;

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,

      decoration: BoxDecoration(
        color: cardsAndContainers,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🧾 Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "الفاتورة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.receipt_long),
            ],
          ),

          // 💰 Total Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("الإجمالي:", style: TextStyle(fontSize: 16)),
              Text(
                "$totalPrice EGP",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          // 🖨️ Print Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.print),
              label: const Text("طباعة الفاتورة"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
