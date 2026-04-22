import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'receipt_state.dart';

class ReceiptCubit extends Cubit<ReceiptState> {
  ReceiptCubit() : super(ReceiptInitial());
}
