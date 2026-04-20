// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cashier_z/feature/mange_products_mode/data/local/hive_helper.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';

part 'mange_products_state.dart';

class MangeProductsCubit extends Cubit<MangeProductsState> {
  MangeProductsCubit() : super(MangeProductsInitial());

  // =========================
  // Load all products
  // =========================
  void loadProducts() {
    final products = HiveHelper.getProducts();
    emit(ProductsLoaded(products));
  }

  // =========================
  // Scan / Search product
  // =========================
  void scanBarcode(String barcode) {
    emit(ProductLoading());

    final products = HiveHelper.getProducts();

    try {
      final product = products.firstWhere(
        (p) => p.barcode == barcode,
      );

      emit(ProductFound(product));
    } catch (e) {
      emit(ProductNotFound(barcode));
    }
  }

  // =========================
  // Add new product
  // =========================
  void addProduct({
    required String name,
    required String barcode,
    required double price,
  }) {
    final product = ProductModel(
      name: name,
      barcode: barcode,
      price: price,
    );

    HiveHelper.addProduct(product);

    emit(ProductAdded(product));

    // refresh list
    loadProducts();
  }

  // =========================
  // Update price (important for cashier mode too)
  // =========================
  void updatePrice({
    required ProductModel product,
    required double newPrice,
  }) {
    product.price = newPrice;
    product.save(); // HiveObject method

    emit(ProductUpdated());

    loadProducts();
  }
}