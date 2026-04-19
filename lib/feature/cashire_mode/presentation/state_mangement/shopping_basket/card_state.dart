part of 'card_cubit.dart';

@immutable
sealed class CardState {}

/// ⚪ Initial
final class CardInitial extends CardState {}

/// 🟢 Loaded cart state
final class CardLoaded extends CardState {
  final List<CartItem> products;
  final double total;

  CardLoaded({
    required this.products,
    required this.total,
  });
}