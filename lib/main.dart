import 'package:cash_app/state/app_state/app_state.dart';
import 'package:cash_app/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final appStateCubit = AppStateCubit(AppState.init());

  runApp(CashApp(appStateCubit: appStateCubit));
}

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit(super.initialState);

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}

class CashApp extends StatelessWidget {
  const CashApp({
    required this.appStateCubit,
    super.key,
  });

  final AppStateCubit appStateCubit;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appStateCubit,
      child: MaterialApp.router(
        title: 'Cash App',
        routerConfig: router,
      ),
    );
  }
}
