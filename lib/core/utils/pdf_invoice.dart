import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';

Future<void> printInvoice(List<CartItem> items, double total) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80, // thermal paper size
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // 🏪 Shop Header
            pw.Center(
              child: pw.Text(
                "Cashier Z Store",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),

            pw.Center(
              child: pw.Text("Tel: 01090201040"),
            ),

            pw.Divider(),

            // 🧾 Items
            ...items.map(
              (item) => pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("${item.product.name} x${item.quantity}"),
                  pw.Text(item.total.toStringAsFixed(2)),
                ],
              ),
            ),

            pw.Divider(),

            // 💰 Total
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                "TOTAL: ${total.toStringAsFixed(2)} EGP",
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  // 🖨️ Send to Windows Printer Dialog
  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
  );
}