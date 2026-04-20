// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Purchases extends StatelessWidget {

  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("product.name"),

        subtitle: Text("product.barcode"),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// 🔽 decrease
            IconButton(
              onPressed: () {
              
              },
              icon: const Icon(Icons.remove),
            ),

            /// quantity
            Text(
            "quantity",
              style: const TextStyle(fontSize: 16),
            ),

            /// 🔼 increase
            IconButton(
              onPressed: () {
               
              },
              icon: const Icon(Icons.add),
            ),

            /// 💰 price
            Text(
              "Price",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}