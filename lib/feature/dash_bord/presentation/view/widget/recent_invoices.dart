import 'package:flutter/material.dart';

class RecentInvoicesList extends StatelessWidget {
  const RecentInvoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Recent Invoices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Divider(),

            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text("#INV001"),
                    subtitle: Text("250 EGP"),
                  ),

                  ListTile(
                    title: Text("#INV002"),
                    subtitle: Text("430 EGP"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}