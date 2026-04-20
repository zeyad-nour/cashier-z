import 'package:hive/hive.dart';
import '../models/product_model.dart';

class HiveHelper {
  static const String boxName = "products_box";

  static Box<ProductModel> getBox() {
    return Hive.box<ProductModel>(boxName);
  }

  static List<ProductModel> getProducts() {
    return getBox().values.toList();
  }

  static void addProduct(ProductModel product) {
    getBox().put(product.barcode, product); // 👈 مهم
  }

  static ProductModel? getByBarcode(String barcode) {
    return getBox().get(barcode);
  }

  static void clear() {
    getBox().clear();
  }
}
