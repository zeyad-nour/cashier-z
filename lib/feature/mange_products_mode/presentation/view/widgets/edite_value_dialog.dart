import 'package:flutter/material.dart';

class EditValueDialog extends StatelessWidget {
  final String title;
  final String label;
  final String initialValue;
  final Function(String value) onSave;

  const EditValueDialog({
    super.key,
    required this.title,
    required this.label,
    required this.initialValue,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: initialValue);

    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("إلغاء"),
        ),
        ElevatedButton(
          onPressed: () {
            onSave(controller.text);
            Navigator.pop(context);
          },
          child: const Text("حفظ"),
        ),
      ],
    );
  }
}