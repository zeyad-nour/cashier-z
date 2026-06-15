import 'package:cashier_z/core/utils/invoice_model.dart';
import 'package:hive/hive.dart';


class InvoiceHiveHelper {
  static const String boxName = "invoices_box";

  static Box<InvoiceModel> getBox() {
    return Hive.box<InvoiceModel>(boxName);
  }

  static List<InvoiceModel> getInvoices() {
    return getBox().values.toList();
  }

  static Future<void> addInvoice(
    InvoiceModel invoice,
  ) async {
    await getBox().add(invoice);
  }

  static Future<void> clearInvoices() async {
    await getBox().clear();
  }
}