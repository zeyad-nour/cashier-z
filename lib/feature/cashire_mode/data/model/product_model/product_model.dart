import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String barcode;

  @HiveField(2)
  final double price;

  ProductModel({
    required this.name,
    required this.barcode,
    required this.price,
  });
}