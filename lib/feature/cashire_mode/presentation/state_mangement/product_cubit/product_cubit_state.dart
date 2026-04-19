import 'package:cashier_z/feature/cashire_mode/data/model/product_model/product_model.dart';
import 'package:meta/meta.dart';

@immutable
sealed class ProductCubitState {}

/// ⚪ Initial
final class ProductInitial extends ProductCubitState {}

/// ⏳ Loading
final class ProductLoading extends ProductCubitState {}

/// 🟢 Success (data loaded)
final class ProductLoaded extends ProductCubitState {
  final List<ProductModel> products;

  ProductLoaded(this.products);
}

/// 🔴 Error
final class ProductError extends ProductCubitState {
  final String message;

  ProductError(this.message);
}