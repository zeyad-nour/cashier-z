// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cashier_z/feature/mange_products_mode/data/local/hive_helper.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';

part 'mange_products_state.dart';

class MangeProductsCubit extends Cubit<MangeProductsState> {
  MangeProductsCubit() : super(MangeProductsInitial()) {
    loadProducts();
  }

  void loadProducts() {
    final products = HiveHelper.getProducts();
    emit(ProductsLoaded(products));
  }

  void scanBarcode(String barcode) {
    final product = HiveHelper.getByBarcode(barcode);

    if (product != null) {
      emit(ProductFound(product));
    } else {
      emit(ProductNotFound(barcode));
    }

    loadProducts();
  }

  void addProduct({
    required String name,
    required String barcode,
    required double price,
  }) {
    final existing = HiveHelper.getByBarcode(barcode);

    if (existing != null) {
      emit(ProductFound(existing));
      return;
    }

    final product = ProductModel(
      name: name,
      barcode: barcode,
      price: price,
    );

    HiveHelper.addProduct(product);

    emit(ProductAdded(product));
    loadProducts();
  }

  void updatePrice({
    required String barcode,
    required double newPrice,
  }) {
    final product = HiveHelper.getByBarcode(barcode);

    if (product == null) {
      emit(ProductNotFound(barcode));
      return;
    }

    product.price = newPrice;
    product.save();

    emit(ProductUpdated());
    loadProducts();
  }

  void deleteProduct(String barcode) {
    final product = HiveHelper.getByBarcode(barcode);

    if (product == null) {
      emit(ProductNotFound(barcode));
      return;
    }

    product.delete();

    emit(ProductDeleted());
    loadProducts();
  }
}