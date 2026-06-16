import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/sales_widget/Invoice_and_sales_record_body.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/beast_prodcut_sales.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/custom_header_widget.dart';
import 'package:flutter/material.dart';

class DashBordBody extends StatelessWidget {
  const DashBordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      children: [
        CustomHeaderWidget(),
        Divider(),
        Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InvoiceAndSalesRecordBody(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width * 0.1,
              height: MediaQuery.sizeOf(context).height * 0.06,
              color: primaryColor,
              child: Text("المبيعات", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        Divider(),
        //Orderd Sales
        Expanded(child: BestProductSales()),
      ],
    );
  }
}
