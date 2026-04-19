import 'package:cashier_z/feature/cashire_mode/data/model/product_model/product_model.dart';
import 'package:cashier_z/feature/cashire_mode/data/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  final ProductRepository repo;

  ProductCubit(this.repo) : super(ProductInitial());

  /// 📦 Load all products from Hive
  void loadProducts() {
    try {
      emit(ProductLoading());

      final products = repo.getProducts();

      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to load products: $e"));
    }
  }

  /// ➕ Add product
  Future<void> addProduct(ProductModel product) async {
    try {
      await repo.add(product);
      loadProducts();
    } catch (e) {
      emit(ProductError("Failed to add product: $e"));
    }
  }

  /// ❌ Delete product by barcode
  Future<void> deleteProduct(String barcode) async {
    try {
      await repo.delete(barcode);
      loadProducts();
    } catch (e) {
      emit(ProductError("Failed to delete product: $e"));
    }
  }

  /// 🧹 Refresh manually
  void refresh() {
    loadProducts();
  }
}
