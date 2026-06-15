import 'package:cashier_z/core/widgets/scan_bar_code_field.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_body.dart';
import 'package:flutter/material.dart';

class DashBord extends StatelessWidget {
  DashBord({super.key});
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: DashBordBody());
  }
}
