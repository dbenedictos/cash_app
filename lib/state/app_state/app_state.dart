import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(0) int counter,
  }) = _AppState;

  factory AppState.init() => AppState();
}
