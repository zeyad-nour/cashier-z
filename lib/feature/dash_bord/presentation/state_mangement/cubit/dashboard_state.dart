import 'package:cashier_z/feature/dash_bord/data/model/product_sales.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  final List<ProductSales> bestSellingProducts;
  final double totalSales;
  final int invoicesCount;

  DashboardLoaded({
    required this.bestSellingProducts,
    required this.totalSales,
    required this.invoicesCount,
  });
}

final class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
