import 'package:cashier_z/feature/cashire_mode/data/data_source/product_local_ds.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/product_model/product_model.dart';
import 'package:cashier_z/feature/cashire_mode/data/repo/product_repo.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/state_mangement/product_cubit/product_cubit_cubit.dart';
import 'package:cashier_z/feature/cashire_mode/presentation/view/cashire_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());

  await Hive.openBox<ProductModel>('products');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            ProductRepository(
              ProductLocalDataSource(Hive.box<ProductModel>('products')),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CashireMode(),
      ),
    );
  }
}
