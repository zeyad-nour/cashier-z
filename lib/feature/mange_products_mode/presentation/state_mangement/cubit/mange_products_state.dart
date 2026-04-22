part of 'mange_products_cubit.dart';

@immutable
sealed class MangeProductsState {}

final class MangeProductsInitial extends MangeProductsState {}

final class ProductLoading extends MangeProductsState {}

final class ProductFound extends MangeProductsState {
  final ProductModel product;
  ProductFound(this.product);
}

final class ProductNotFound extends MangeProductsState {
  final String barcode;
  ProductNotFound(this.barcode);
}

final class ProductAdded extends MangeProductsState {
  final ProductModel product;
  ProductAdded(this.product);
}

final class ProductUpdated extends MangeProductsState {}

final class ProductsLoaded extends MangeProductsState {
  final List<ProductModel> products;
  ProductsLoaded(this.products);
}

class ProductDeleted extends MangeProductsState {}