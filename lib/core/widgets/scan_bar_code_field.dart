// ignore_for_file: deprecated_member_use

import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ScanBarCodeField extends StatefulWidget {
  final Function(String value)? onScan;

  const ScanBarCodeField({super.key, this.onScan});

  @override
  State<ScanBarCodeField> createState() => _ScanBarCodeFieldState();
}

class _ScanBarCodeFieldState extends State<ScanBarCodeField> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /// 👇 أول ما الصفحة تفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });

    /// 👇 إدارة الفوكس بذكاء
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 100), () {
          /// 👇 أهم شرط (لو مفيش Dialog فوقي)
          if (!mounted) return;

          final isCurrentRoute = ModalRoute.of(context)?.isCurrent ?? true;

          if (isCurrentRoute) {
            focusNode.requestFocus();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onFieldSubmitted: (value) {
          widget.onScan?.call(value);
          controller.clear();

          /// 👇 يرجع الفوكس بعد الاسكان
          focusNode.requestFocus();
        },
        decoration: const InputDecoration(
          hintText: titleFieldScan,
          prefixIcon: Icon(Icons.qr_code_scanner),
        ),
      ),
    );
  }
}