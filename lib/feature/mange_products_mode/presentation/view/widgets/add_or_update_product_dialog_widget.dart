// ignore_for_file: invalid_null_aware_operator

import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AddOrUpdateProductDialog extends StatefulWidget {
  final String barcode;
  final String? name;
  final double? price;
  final bool isUpdate;
  final Function(String name, double price, int quantity) onSubmit;
final int quantity;
  const AddOrUpdateProductDialog({
    super.key,
    required this.barcode,
    this.name,
    this.price,
    required this.isUpdate,
    required this.onSubmit,required this.quantity,
  });

  @override
  State<AddOrUpdateProductDialog> createState() =>
      _AddOrUpdateProductDialogState();
}

class _AddOrUpdateProductDialogState extends State<AddOrUpdateProductDialog> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController quantityController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name ?? "");
    priceController = TextEditingController(
      text: widget.price?.toString() ?? "",
    );
    quantityController = TextEditingController(text: widget?.quantity.toString() ?? "0");
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
          const SizedBox(height: 10),
          //Number Of Iteams Field
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: numberOfItweam),
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
            final quantity = int.tryParse(quantityController.text) ?? 0;

            widget.onSubmit(name, price, quantity);
            Navigator.pop(context);
          },
          child: const Text(save),
        ),
      ],
    );
  }
}
