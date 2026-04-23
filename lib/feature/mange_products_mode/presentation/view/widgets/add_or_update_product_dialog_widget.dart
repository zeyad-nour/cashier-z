import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AddOrUpdateProductDialog extends StatefulWidget {
  final String barcode;
  final String? name;
  final double? price;
  final bool isUpdate;
  final Function(String name, double price) onSubmit;

  const AddOrUpdateProductDialog({
    super.key,
    required this.barcode,
    this.name,
    this.price,
    required this.isUpdate,
    required this.onSubmit,
  });

  @override
  State<AddOrUpdateProductDialog> createState() =>
      _AddOrUpdateProductDialogState();
}

class _AddOrUpdateProductDialogState extends State<AddOrUpdateProductDialog> {
  late TextEditingController nameController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name ?? "");
    priceController = TextEditingController(
      text: widget.price?.toString() ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isUpdate ? updateProduct : addProduct),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!widget.isUpdate)
            TextField(
              autofocus: true,
              controller: nameController,
              decoration: const InputDecoration(labelText: productName),
            ),

          const SizedBox(height: 10),

          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: priceProduct),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(cancel),
        ),
        ElevatedButton(
          onPressed: () {
            final name = nameController.text;
            final price = double.tryParse(priceController.text) ?? 0;

            widget.onSubmit(name, price);
            Navigator.pop(context);
          },
          child: const Text(save),
        ),
      ],
    );
  }
}
