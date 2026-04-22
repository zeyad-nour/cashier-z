import 'package:bloc/bloc.dart';
import 'package:cashier_z/core/utils/build_receipt.dart';
import 'package:cashier_z/core/utils/pdf_invoice.dart';
import 'package:cashier_z/core/utils/print_receipt.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_state.dart';
import 'package:cashier_z/feature/mange_products_mode/data/local/hive_helper.dart';

class ReceiptCubit extends Cubit<ReceiptState> {
  ReceiptCubit() : super(const ReceiptState());

  void scan(String barcode) {
    final product = HiveHelper.getByBarcode(barcode);

    if (product == null) return;

    final items = List<CartItem>.from(state.items);

    final index = items.indexWhere(
      (e) => e.product.barcode == barcode,
    );

    if (index != -1) {
      final item = items[index];
      items[index] = item.copyWith(quantity: item.quantity + 1);
    } else {
      items.add(CartItem(product: product));
    }

    emit(state.copyWith(items: items));
  }

  void increase(int index) {
    final items = List<CartItem>.from(state.items);

    final item = items[index];
    items[index] = item.copyWith(quantity: item.quantity + 1);

    emit(state.copyWith(items: items));
  }

  void decrease(int index) {
    final items = List<CartItem>.from(state.items);

    final item = items[index];

    if (item.quantity > 1) {
      items[index] = item.copyWith(quantity: item.quantity - 1);
    } else {
      items.removeAt(index);
    }

    emit(state.copyWith(items: items));
  }

  /// 📄 PDF (fallback)
  Future<void> printReceiptPdf() async {
    await printInvoice(state.items, state.total);
    clear();
  }

  /// 🖨️ ESC/POS (real printer)
  Future<void> printReceiptEscPos() async {
    final bytes = await buildReceipt(
      state.items,
      state.total,
      "CASHIER Z STORE",
    );

    sendToPrinter(bytes, "YOUR PRINTER NAME");

    clear();
  }

  void clear() {
    emit(const ReceiptState());
  }
}