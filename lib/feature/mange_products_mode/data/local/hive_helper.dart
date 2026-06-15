import 'package:hive/hive.dart';
import '../models/product_model.dart';

class HiveHelper {
  static const String boxName = "products_box_2";

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
static void decreaseQuantity({
  required String barcode,
  required int soldQuantity,
}) {
  final product = getByBarcode(barcode);

  if (product == null) return;

  product.quantity -= soldQuantity;

  if (product.quantity < 0) {
    product.quantity = 0;
  }

  product.save();
}
  static void clear() {
    getBox().clear();
  }
}
