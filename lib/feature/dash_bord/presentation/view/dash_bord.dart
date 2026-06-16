import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_cubit.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/dash_bord_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBord extends StatelessWidget {
  const DashBord({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit()..loadDashboard(),
      child: Scaffold(appBar: AppBar(), body: DashBordBody()),
    );
  }
}
