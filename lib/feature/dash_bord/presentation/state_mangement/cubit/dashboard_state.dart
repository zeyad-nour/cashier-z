import 'package:cashier_z/feature/dash_bord/data/model/product_sales.dart';




sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  final List<ProductSales> bestSellingProducts;

  DashboardLoaded({
    required this.bestSellingProducts,
  });
}

final class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}