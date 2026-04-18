import 'package:flutter/material.dart';

class DownWidget extends StatelessWidget {
  const DownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IncreaseAndDecreasewidget(),
        Text(
          '\$100',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class IncreaseAndDecreasewidget extends StatelessWidget {
  const IncreaseAndDecreasewidget({super.key});

  @override
  Widget build(BuildContext context) {
    int couinter = 1;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
        Text(
          '$couinter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_circle_outline, color: Colors.green),
        ),
      ],
    );
  }
}
