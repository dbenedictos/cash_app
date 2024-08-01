import 'package:cash_app/state/app_state/app_state.dart';
import 'package:cash_app/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class CounterCubit extends Cubit<AppState> {
  CounterCubit(super.initialState);

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cash App',
      routerConfig: router,
    );
  }
}
