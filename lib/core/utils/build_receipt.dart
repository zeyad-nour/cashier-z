import 'dart:typed_data';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';

Future<Uint8List> buildReceipt(
  List<CartItem> items,
  double total,
  String brandName,
) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);

  List<int> bytes = [];

  final invoiceId = DateTime.now().millisecondsSinceEpoch.toString();

  // 🏪 HEADER
  bytes += generator.text(
    brandName,
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
      height: PosTextSize.size2,
      width: PosTextSize.size2,
    ),
  );

  bytes += generator.text(
    "Developed By: Eng. Zeyad Ahmed Nour",
    styles: const PosStyles(align: PosAlign.center),
  );

  bytes += generator.hr();

  // 📞 INFO
  bytes += generator.text(
    "01001386275 / 01090201040",
    styles: const PosStyles(align: PosAlign.center),
  );

  bytes += generator.text(
    "Sohag - Belina - Al-Haraga",
    styles: const PosStyles(align: PosAlign.center),
  );

  bytes += generator.hr();

  // 🧾 HEADER
  bytes += generator.row([
    PosColumn(text: 'ITEM', width: 6),
    PosColumn(
      text: 'TOTAL',
      width: 6,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.hr();

  // 🛒 ITEMS
  for (var item in items) {
    bytes += generator.row([
      PosColumn(
        text: "${item.product.name} x${item.quantity}",
        width: 6,
      ),
      PosColumn(
        text: item.total.toStringAsFixed(2),
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
  }

  bytes += generator.hr();

  // 💰 TOTAL
  bytes += generator.text(
    "TOTAL: ${total.toStringAsFixed(2)} EGP",
    styles: const PosStyles(
      align: PosAlign.right,
      bold: true,
    ),
  );

  bytes += generator.hr();

  // 📦 SERVICES
  bytes += generator.text("Vodafone Cash Available",
      styles: const PosStyles(align: PosAlign.center));

  bytes += generator.text("Free Delivery",
      styles: const PosStyles(align: PosAlign.center));

  bytes += generator.text("24 Hours Service",
      styles: const PosStyles(align: PosAlign.center));

  bytes += generator.hr();

  // 📊 QR
  bytes += generator.qrcode(
    "STORE:$brandName\nINVOICE:$invoiceId\nTOTAL:$total",
  );

  bytes += generator.feed(2);
  bytes += generator.cut();

  return Uint8List.fromList(bytes);
}