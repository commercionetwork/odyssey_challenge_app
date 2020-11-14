import 'package:commercio_ui/commercio_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odyssey_challenge_app/login_screen.dart';
import 'package:odyssey_challenge_app/utils/style.dart';
import 'package:odyssey_challenge_app/widgets/base_scaffold_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odyssey Challenge App',
      theme: companyTheme,
      darkTheme: companyDarkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => CommercioAccountRestoreWalletBloc(
                    commercioAccount: context.read<StatefulCommercioAccount>(),
                  ),
                ),
              ],
              child: const LoginScreen(),
            ),
        '/home': (_) => const BaseScaffoldWidget(),
      },
    );
  }
}
