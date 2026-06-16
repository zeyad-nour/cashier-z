import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_cubit.dart';
import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestProductSales extends StatelessWidget {
  const BestProductSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "أفضل المنتجات مبيعاً",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(),

            Expanded(
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  if (state is DashboardLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is DashboardError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is DashboardLoaded) {
                    return ListView.builder(
                      itemCount: state.bestSellingProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.bestSellingProducts[index];

                        return ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(
                            product.productName,
                            style: TextStyle(fontSize: 25, color: primaryColor),
                          ),
                          trailing: Text(
                            "${product.quantitySold}",
                            style: TextStyle(fontSize: 25, color: Colors.red),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
