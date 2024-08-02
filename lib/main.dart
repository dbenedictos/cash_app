import 'package:cash_app/apis/cash_app_api_service.dart';
import 'package:cash_app/cash_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerLazySingleton<CashAppApiService>(() => CashAppApiService());

  runApp(const CashApp());
}
