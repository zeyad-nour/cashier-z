import 'package:cashier_z/feature/cashire_mode/data/data_source/product_local_ds.dart';

import '../../data/model/product_model/product_model.dart';

class ProductRepository {
  final ProductLocalDataSource dataSource;

  ProductRepository(this.dataSource);

  List<ProductModel> getProducts() {
    return dataSource.getAllProducts();
  }

  Future<void> add(ProductModel product) {
    return dataSource.addProduct(product);
  }

  Future<void> delete(String barcode) {
    return dataSource.deleteProduct(barcode);
  }
}