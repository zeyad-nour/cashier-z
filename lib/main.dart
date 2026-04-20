import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:cashier_z/feature/cashire_mode/presentation/view/cashire_mode.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // register adapter
  Hive.registerAdapter(ProductModelAdapter());

  // open box (must match HiveHelper)
  await Hive.openBox<ProductModel>('products_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CashireMode(),
    );
  }
}