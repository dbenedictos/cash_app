import 'package:cash_app/apis/models/wallet.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/repositories/cash_app_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCubit extends Cubit<AsyncState<Wallet>> {
  WalletCubit(this._repository) : super(const AsyncState.loading());

  final CashAppRepository _repository;

  Future<void> getWalletByUser(int userId) async {
    emit(const AsyncState.loading());

    await _repository.getWalletByUser(userId).then((wallet) {
      emit(AsyncState(wallet));
    }).onError((error, stackTrace) {
      final err = error as DioException;
      emit(AsyncState.error(err.response?.statusCode.toString()));
    });
  }

  Future<void> updateWallet(Wallet wallet) async {
    emit(const AsyncState.loading());

    await _repository.updateWallet(wallet).then((wallet) {
      emit(AsyncState(wallet));
    }).onError((error, stackTrace) {
      final err = error as DioException;
      emit(AsyncState.error(err.response?.statusCode.toString()));
    });
  }
}
