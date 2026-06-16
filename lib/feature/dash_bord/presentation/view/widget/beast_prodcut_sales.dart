import 'package:flutter/material.dart';

class BeastProdcutSales extends StatelessWidget {
  const BeastProdcutSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "أفضل المنتجات مبيعاً",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text("${index + 1}")),
                      title: Text("بيبسي"),
                      trailing: Text("320"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
