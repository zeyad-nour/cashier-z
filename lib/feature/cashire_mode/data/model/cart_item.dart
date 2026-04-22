import 'package:cashier_z/feature/mange_products_mode/data/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final int quantity;

  const CartItem({
    required this.product,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }

  double get total => product.price * quantity;
}