import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void sendToPrinter(Uint8List data, String printerName) {
  final phPrinter = calloc<HANDLE>();
  final printerNamePtr = printerName.toNativeUtf16();

  try {
    final opened = OpenPrinter(
      printerNamePtr,
      phPrinter,
      nullptr,
    );

    if (opened == 0) {
      throw Exception("Cannot open printer: $printerName | Error: ${GetLastError()}");
    }

    final hPrinter = phPrinter.value;

    final docInfo = calloc<DOC_INFO_1>()
      ..ref.pDocName = 'ESC/POS PRINT'.toNativeUtf16()
      ..ref.pDatatype = 'RAW'.toNativeUtf16()
      ..ref.pOutputFile = nullptr;

    if (StartDocPrinter(hPrinter, 1, docInfo) == 0) {
      throw Exception("StartDocPrinter failed: ${GetLastError()}");
    }

    StartPagePrinter(hPrinter);

    final buffer = calloc<Uint8>(data.length);
    final typed = buffer.asTypedList(data.length);
    typed.setAll(0, data);

    final written = calloc<DWORD>();

    WritePrinter(
      hPrinter,
      buffer,
      data.length,
      written,
    );

    EndPagePrinter(hPrinter);
    EndDocPrinter(hPrinter);
    ClosePrinter(hPrinter);

    calloc.free(buffer);
    calloc.free(written);
    calloc.free(docInfo);
  } finally {
    calloc.free(printerNamePtr);
    calloc.free(phPrinter);
  }
}