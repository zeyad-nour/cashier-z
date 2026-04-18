
import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/down_widget.dart';
import 'package:flutter/material.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: cardsAndContainers,
          child: ListTile(
            title: Text(
              'name', //name
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryTextColor,
              ),
            ),
            subtitle: Column(
              children: [
                Text(
                  '15263285818', //seireal number
                  style: TextStyle(fontSize: 16, color: secounderyTextColor),
                ),
                DownWidget(),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete_outlined, color: Colors.red),
            ), //prices
          ),
        ),
        // DownWidget(),
      ],
    );
  }
}
