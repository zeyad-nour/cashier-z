import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';

Future<void> printInvoice(List<CartItem> items, double total) async {
  final pdf = pw.Document();

  final invoiceId = DateTime.now().millisecondsSinceEpoch.toString();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80,
      build: (context) {
        return pw.Directionality(
          textDirection: pw.TextDirection.rtl, // 🇸🇦 عربي + إنجليزي دعم أفضل
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              /// 🏪 HEADER
              pw.Text(
                "كاشير زد ستور\nCASHIER Z STORE",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 5),

              pw.Text("نظام نقاط بيع حديث | Modern POS System"),

              pw.SizedBox(height: 10),

              /// 📞 INFO
              pw.Text("📞 01001386275 / 01090201040"),
              pw.Text("📍 سوهاج - البلينا - الحرجة بالقرعان"),

              pw.Divider(),

              /// 🧾 ITEMS HEADER
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "الإجمالي / Total",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "الصنف / Item",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),

              pw.Divider(),

              /// 🛒 ITEMS
              ...items.map(
                (item) => pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      item.total.toStringAsFixed(2),
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        "${item.product.name} x${item.quantity}",
                        textAlign: pw.TextAlign.right,
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),

              pw.Divider(),

              /// 💰 TOTAL
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  "الإجمالي / TOTAL: ${total.toStringAsFixed(2)} EGP",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.SizedBox(height: 10),

              pw.Divider(),

              /// 📦 SERVICES
              pw.Text("📱 خدمة فودافون كاش متاحة | Vodafone Cash Available"),
              pw.Text("🚚 خدمة توصيل مجانية | Free Delivery"),
              pw.Text("⏰ الخدمة 24 ساعة | 24 Hours Service"),

              pw.SizedBox(height: 10),

              /// 📊 QR CODE
              pw.BarcodeWidget(
                barcode: pw.Barcode.qrCode(),
                width: 120,
                height: 120,
                data:
                    '''
CASHIER Z STORE
Invoice: $invoiceId
Total: ${total.toStringAsFixed(2)}
''',
              ),

              pw.SizedBox(height: 10),

              pw.Text(
                "شكراً لزيارتكم ❤️ | Thank You",
                textAlign: pw.TextAlign.center,
              ),
            ],
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(onLayout: (format) async => pdf.save());
}
