import 'package:cash_app/cubit/user_cubit/user_cubit.dart';
import 'package:cash_app/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:cash_app/repositories/cash_app_repository.dart';
import 'package:cash_app/utilities/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashApp extends StatelessWidget {
  const CashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // hard coded id. Since there's no log in feature. Imagine the user has already logged in
        // and we have fetched the user id.
        BlocProvider(create: (_) => UserCubit(CashAppRepository())..getUserById(1)),
        BlocProvider(create: (_) => WalletCubit(CashAppRepository())),
      ],
      child: MaterialApp.router(
        title: 'Cash App',
        routerConfig: router,
      ),
    );
  }
}
