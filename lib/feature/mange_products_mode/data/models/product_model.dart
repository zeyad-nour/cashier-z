import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String barcode;

  @HiveField(2)
  double price;

  @HiveField(3)
  int quantity;

  ProductModel({
    required this.name,
    required this.barcode,
    required this.price,
    required this.quantity,
  });
}