

// ignore_for_file: deprecated_member_use

import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';





class ScanBarCodeField extends StatefulWidget {
  final Function(String value)? onScan;
  final bool enableAutoFocus; // 👈 جديد

  const ScanBarCodeField({
    super.key,
    this.onScan,
    this.enableAutoFocus = true,
  });

  @override
  State<ScanBarCodeField> createState() => _ScanBarCodeFieldState();
}

class _ScanBarCodeFieldState extends State<ScanBarCodeField> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.enableAutoFocus) {
        focusNode.requestFocus();
      }
    });

    focusNode.addListener(() {
      if (!focusNode.hasFocus && widget.enableAutoFocus) {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!mounted) return;

          final isCurrentRoute =
              ModalRoute.of(context)?.isCurrent ?? true;

          if (isCurrentRoute && widget.enableAutoFocus) {
            focusNode.requestFocus();
          }
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant ScanBarCodeField oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 👇 لو رجعنا enable → رجّع الفوكس
    if (widget.enableAutoFocus && !oldWidget.enableAutoFocus) {
      focusNode.requestFocus();
    }
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

          if (widget.enableAutoFocus) {
            focusNode.requestFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: titleFieldScan,
          prefixIcon: Icon(Icons.qr_code_scanner),
        ),
      ),
    );
  }
}











