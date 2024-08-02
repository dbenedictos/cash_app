import 'package:cash_app/apis/models/transaction.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/repositories/cash_app_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<AsyncState<List<Transaction>>> {
  TransactionsCubit(this._repository) : super(const AsyncState.loading());

  final CashAppRepository _repository;

  Future<void> getByUser(int userId) async {
    emit(const AsyncState.loading());

    await _repository.getTransactionsByUser(userId).then((transactions) {
      emit(AsyncState(transactions));
    }).onError((error, stackTrace) {
      final err = error as DioException;
      emit(AsyncState.error(err.response?.statusCode.toString()));
    });
  }
}
