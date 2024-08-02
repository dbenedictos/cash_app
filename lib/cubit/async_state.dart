import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState(T value) = Data<T>;
  const factory AsyncState.loading() = Loading<T>;
  const factory AsyncState.error([String? message]) = Error<T>;
}
