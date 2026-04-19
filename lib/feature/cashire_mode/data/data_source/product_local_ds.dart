import 'package:hive/hive.dart';
import '../model/product_model/product_model.dart';

class ProductLocalDataSource {
  final Box<ProductModel> box;

  ProductLocalDataSource(this.box);

  List<ProductModel> getAllProducts() {
    return box.values.toList();
  }

  Future<void> addProduct(ProductModel product) async {
    await box.put(product.barcode, product);
  }

  Future<void> deleteProduct(String barcode) async {
    await box.delete(barcode);
  }

  Future<void> clearAll() async {
    await box.clear();
  }
}