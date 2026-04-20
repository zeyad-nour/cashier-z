import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/mange_products_mode_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MangeProductsMode extends StatelessWidget {
  const MangeProductsMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MangeProductsCubit()..loadProducts(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: const MangeProductsModeBody(),
      ),
    );
  }
}