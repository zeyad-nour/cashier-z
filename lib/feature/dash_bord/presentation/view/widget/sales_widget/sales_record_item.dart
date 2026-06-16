import 'package:flutter/material.dart';

class SalesRecordItem extends StatelessWidget {
  final String title;
  final String value;

  const SalesRecordItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
