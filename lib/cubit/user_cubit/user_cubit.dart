import 'package:cash_app/apis/models/user.dart';
import 'package:cash_app/cubit/async_state.dart';
import 'package:cash_app/repositories/cash_app_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<AsyncState<User>> {
  UserCubit(this._repository) : super(const AsyncState.loading());

  final CashAppRepository _repository;

  Future<void> getUserById(int id) async {
    emit(const AsyncState.loading());

    await _repository.getUserById(id).then((user) {
      emit(AsyncState(user));
    }).onError((error, stackTrace) {
      final err = error as DioException;
      emit(AsyncState.error(err.response?.statusCode.toString()));
    });
  }
}
