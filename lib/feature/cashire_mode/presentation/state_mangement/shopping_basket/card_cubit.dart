// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cashier_z/feature/cashire_mode/data/model/product_model/product_model.dart';

part 'card_state.dart';

///  Cart Item wrapper (runtime only)
class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  final List<CartItem> _cart = [];

  ///  Add product from scan
  void addProduct(ProductModel product) {
    final index = _cart.indexWhere(
      (item) => item.product.barcode == product.barcode,
    );

    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(CartItem(product: product));
    }

    _emitState();
  }

  ///  increase quantity
  void increase(String barcode) {
    final index = _cart.indexWhere(
      (item) => item.product.barcode == barcode,
    );

    if (index != -1) {
      _cart[index].quantity++;
      _emitState();
    }
  }

  ///  decrease quantity
  void decrease(String barcode) {
    final index = _cart.indexWhere(
      (item) => item.product.barcode == barcode,
    );

    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      } else {
        _cart.removeAt(index);
      }
      _emitState();
    }
  }

  ///  remove item
  void remove(String barcode) {
    _cart.removeWhere(
      (item) => item.product.barcode == barcode,
    );
    _emitState();
  }

  /// 🧹 clear cart
  void clear() {
    _cart.clear();
    _emitState();
  }

  ///  total price
  double _calculateTotal() {
    return _cart.fold(
      0,
      (sum, item) =>
          sum + (item.product.price * item.quantity),
    );
  }

  ///  emit state
  void _emitState() {
    emit(
      CardLoaded(
        products: List.from(_cart),
        total: _calculateTotal(),
      ),
    );
  }
}