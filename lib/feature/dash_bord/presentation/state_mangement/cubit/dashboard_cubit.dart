import 'package:bloc/bloc.dart';
import 'package:cashier_z/feature/dash_bord/data/model/product_sales.dart';
import 'package:cashier_z/feature/dash_bord/presentation/state_mangement/cubit/dashboard_state.dart';
import 'package:cashier_z/feature/invoices/data/local/invoice_hive_helper.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  Future<void> loadDashboard() async {
    emit(DashboardLoading());

    try {
      final invoices = InvoiceHiveHelper.getInvoices();

      final Map<String, int> salesMap = {};

      double totalSales = 0;

      for (final invoice in invoices) {
        totalSales += invoice.total; //sum all invoices

        for (final item in invoice.items) {
          salesMap.update(
            item.productName,
            (value) => value + item.quantity,
            ifAbsent: () => item.quantity,
          );
        }
      }

      final products = salesMap.entries.map((entry) {
        return ProductSales(productName: entry.key, quantitySold: entry.value);
      }).toList();

      products.sort((a, b) => b.quantitySold.compareTo(a.quantitySold));

      emit(
        DashboardLoaded(
          bestSellingProducts: products,
          totalSales: totalSales,
          invoicesCount: invoices.length,
        ),
      );
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

  //delete bestSellingProducts and all register
  Future<void> clearDashboardData() async {
    emit(DashboardLoading());

    try {
      await InvoiceHiveHelper.clearInvoices();

      emit(
        DashboardLoaded(
          bestSellingProducts: [],
          totalSales: 0,
          invoicesCount: 0,
        ),
      );
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}
