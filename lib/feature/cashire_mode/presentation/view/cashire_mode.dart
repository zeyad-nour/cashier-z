import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/cahire_mode_body.dart';
import 'package:flutter/material.dart';

class CashireMode extends StatelessWidget {
  const CashireMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundColor, body: CashireModeBody());
  }
}
