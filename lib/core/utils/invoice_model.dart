import 'package:hive/hive.dart';

part 'invoice_model.g.dart';

@HiveType(typeId: 1)
class InvoiceModel extends HiveObject {
  @HiveField(0)
  String invoiceId;

  @HiveField(1)
  DateTime createdAt;

  @HiveField(2)
  double total;

  @HiveField(3)
  List<InvoiceItemModel> items;

  InvoiceModel({
    required this.invoiceId,
    required this.createdAt,
    required this.total,
    required this.items,
  });
}

@HiveType(typeId: 2)
class InvoiceItemModel {
  @HiveField(0)
  String productName;

  @HiveField(1)
  String barcode;

  @HiveField(2)
  double price;

  @HiveField(3)
  int quantity;

  InvoiceItemModel({
    required this.productName,
    required this.barcode,
    required this.price,
    required this.quantity,
  });
}