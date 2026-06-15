import 'package:flutter/material.dart';

class LowStockList extends StatelessWidget {
  const LowStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Low Stock Products",
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
                    title: Text("Sugar"),
                    trailing: Text("3"),
                  ),

                  ListTile(
                    title: Text("Rice"),
                    trailing: Text("5"),
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