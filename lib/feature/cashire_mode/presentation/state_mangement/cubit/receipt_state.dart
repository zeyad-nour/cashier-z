
import 'package:cashier_z/feature/cashire_mode/data/model/cart_item.dart';

class ReceiptState {
  final List<CartItem> items;

  const ReceiptState({this.items = const []});

  double get total {
    return items.fold(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  ReceiptState copyWith({List<CartItem>? items}) {
    return ReceiptState(
      items: items ?? this.items,
    );
  }
}