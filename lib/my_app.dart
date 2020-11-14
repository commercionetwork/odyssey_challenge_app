import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        '/': (_) => const LoginScreen(),
        '/home': (_) => const BaseScaffoldWidget(),
      },
    );
  }
}
