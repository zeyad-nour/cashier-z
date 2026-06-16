// ignore_for_file: file_names

import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_cubit.dart';
import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_state.dart';
import 'package:cashier_z/feature/dash_bord/presentation/view/widget/sales_widget/sales_record_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceAndSalesRecordBody extends StatelessWidget {
  const InvoiceAndSalesRecordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المبيعات والفواتير",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("تأكيد الحذف"),
                  content: const Text("هل تريد حذف كل الفواتير والإحصائيات؟"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("إلغاء"),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await context
                            .read<DashboardCubit>()
                            .clearDashboardData();
                      },
                      child: const Text("حذف"),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.delete, color: Colors.red, size: 35),
          ),
        ],
      ),

      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DashboardError) {
            return Center(child: Text(state.message));
          }

          if (state is DashboardLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SalesRecordCard(
                date:
                    "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                totalSales: state.totalSales,
                invoicesCount: state.invoicesCount,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
