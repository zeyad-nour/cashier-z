import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';

Future<void> printInvoice(List<CartItem> items, double total) async {
  final pdf = pw.Document();

  final invoiceId = DateTime.now().millisecondsSinceEpoch.toString();

  final arabicFont = await PdfGoogleFonts.notoNaskhArabicRegular();
  final arabicBold = await PdfGoogleFonts.notoNaskhArabicBold();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll80,
      theme: pw.ThemeData.withFont(base: arabicFont, bold: arabicBold),
      build: (context) {
        return pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              /// 🏪 HEADER
              pw.Text(
                brandName,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 4),
              pw.Text("Developed By: Eng. Zeyad Ahmed Nour"),
              pw.SizedBox(height: 8),

              pw.Divider(),

              /// 📞 INFO
              pw.Text("01001386275 / 01090201040"),
              pw.Text("سوهاج - البلينا - الحرجة بالقرعان"),

              pw.Divider(),

              /// 🧾 TABLE HEADER (FIXED ALIGNMENT)
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.Text(
                      "الصنف / Item",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                  pw.Expanded(
                    flex: 1,
                    child: pw.Text(
                      "الإجمالي",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                ],
              ),

              pw.Divider(),

              /// 🛒 ITEMS (FIXED ALIGNMENT)
              ...items.map(
                (item) => pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 3),
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 3,
                        child: pw.Text(
                          "${item.product.name} x${item.quantity}",
                          textAlign: pw.TextAlign.right,
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          item.total.toStringAsFixed(2),
                          textAlign: pw.TextAlign.center,
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              pw.Divider(),

              /// 💰 TOTAL
              pw.Container(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  "الإجمالي النهائي: ${total.toStringAsFixed(2)} EGP",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),

              pw.SizedBox(height: 10),

              pw.Divider(),

              /// 📦 SERVICES
              pw.Text(" فودافون كاش متاح | Vodafone Cash Available"),
              pw.Text(" خدمة توصيل مجانية | Free Delivery"),
              pw.Text(" خدمة 24 ساعة | 24 Hours Service"),

              pw.SizedBox(height: 10),

              /// 📊 QR CODE
              pw.BarcodeWidget(
                barcode: pw.Barcode.qrCode(),
                width: 120,
                height: 120,
                data:
                    '''
STORE: $brandName
INVOICE: $invoiceId
TOTAL: ${total.toStringAsFixed(2)}
''',
              ),

              pw.SizedBox(height: 10),

              pw.Divider(),

              /// 👨‍💻 SIGNATURE
              pw.Text("شكراً لزيارتكم ", textAlign: pw.TextAlign.center),
              pw.Text(
                "Developed By: Eng. Zeyad Ahmed Nour",
                style: pw.TextStyle(fontSize: 10),
              ),
              pw.Text("01090201040", style: pw.TextStyle(fontSize: 10)),
            ],
          ),
        );
      },
    ),
  );

  await Printing.layoutPdf(onLayout: (format) async => pdf.save());
}
