import 'package:cashier_z/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CardInfoProducts extends StatelessWidget {
  //name , serial number , price
  const CardInfoProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.21,
      height: MediaQuery.sizeOf(context).height * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderAndDivider, width: 1.5),
      ),
      child: Card(
        color: cardsAndContainers,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "حليب 1 لتر",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              "123456789",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Spacer(),
            Divider(),
            Text(
              "السعر",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
