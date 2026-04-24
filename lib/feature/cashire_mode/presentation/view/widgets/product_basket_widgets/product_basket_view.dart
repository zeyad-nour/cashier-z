import 'package:cashier_z/core/utils/app_strings.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/widgets/product_basket_widgets/product_basket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/cubit/receipt_cubit.dart';

class ProductBasketView extends StatelessWidget {
  const ProductBasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔥 Header + زرار المسح
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              productBasket,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                /// ⚠️ تأكيد قبل المسح
                final confirm = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("تأكيد"),
                    content: const Text("هل تريد مسح كل العناصر من السلة؟"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text("إلغاء"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text("مسح"),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  context.read<ReceiptCubit>().clearCart();

                  /// 💡 Feedback للمستخدم
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("تم مسح السلة")));
                }
              },
            ),
          ],
        ),

        const SizedBox(height: 10),

        /// 🛒 السلة
        const ProductBasket(),
      ],
    );
  }
}
