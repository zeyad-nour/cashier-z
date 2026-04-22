import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cashier_z/feature/cashire_mode/presentation/view/cashire_mode.dart';
import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';
import 'package:cashier_z/feature/mange_products_mode/presentation/state_mangement/cubit/mange_products_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>('products_box');

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MangeProductsCubit()..loadProducts(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CashireMode(),
      ),
    );
  }
}