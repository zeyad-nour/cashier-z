import 'package:cashier_z/core/utils/colors.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/view/widgets/edite_value_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardInfoProducts extends StatelessWidget {
  final ProductModel product;

  const CardInfoProducts({super.key, required this.product});

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Edite Price
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text("تعديل الاسم"),
              onTap: () {
                Navigator.pop(context);

                // final controller = TextEditingController(
                //   text: product.price.toString(),
                // );

                showDialog(
                  context: context,
                  builder: (_) => EditValueDialog(
                    title: "تعديل السعر",
                    label: "السعر الجديد",
                    initialValue: product.price.toString(),
                    onSave: (value) {
                      context.read<MangeProductsCubit>().updatePrice(
                        barcode: product.barcode,
                        newPrice: double.tryParse(value) ?? 0,
                        quantity: product.quantity,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text("تعديل السعر"),
              onTap: () {
                Navigator.pop(context);

                // final controller = TextEditingController(
                //   text: product.price.toString(),
                // );

                showDialog(
                  context: context,
                  builder: (_) => EditValueDialog(
                    title: "تعديل السعر",
                    label: "السعر الجديد",
                    initialValue: product.price.toString(),
                    onSave: (value) {
                      context.read<MangeProductsCubit>().updatePrice(
                        barcode: product.barcode,
                        newPrice: double.tryParse(value) ?? 0,
                        quantity: product.quantity,
                      );
                    },
                  ),
                );
              },
            ),

            //Edite Quantity
            ListTile(
              leading: const Icon(
                Icons.edit_calendar_outlined,
                color: Colors.red,
              ),
              title: const Text("تعديل الكمية"),
              onTap: () {
                Navigator.pop(context);

                // final controller = TextEditingController(
                //   text: product.quantity.toString(),
                // );

                showDialog(
                  context: context,
                  builder: (_) => EditValueDialog(
                    title: "تعديل الكمية",
                    label: "الكمية الجديدة",
                    initialValue: product.quantity.toString(),
                    onSave: (value) {
                      context.read<MangeProductsCubit>().updateQuantity(
                        barcode: product.barcode,
                        quantity: int.tryParse(value) ?? 0,
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text("حذف المنتج"),
              onTap: () {
                context.read<MangeProductsCubit>().deleteProduct(
                  product.barcode,
                );

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderAndDivider, width: 1.5),
      ),
      child: Card(
        color: cardsAndContainers,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// 🔹 NAME + MENU BUTTON
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  /// ⋮ MENU BUTTON (RIGHT SIDE)
                  InkWell(
                    onTap: () => _showMenu(context),
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// BARCODE
              Text(
                product.barcode,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),

              const Spacer(),
              const Divider(),
              Text(
                "الكمية: ${product.quantity}",
                style: TextStyle(
                  color: product.quantity <= 5 ? Colors.red : Colors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const Divider(),

              /// PRICE
              Text(
                "${product.price} EGP",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
