import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_body.dart';
import 'package:flutter/material.dart';

class DashBord extends StatelessWidget {
  const DashBord({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: DashBordBody());
  }
}
