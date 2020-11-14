import 'package:odyssey_challenge_app/cubits/cubit/auth_cubit.dart';
import 'package:odyssey_challenge_app/cubits/scaffold_navigator_cubit.dart';
import 'package:odyssey_challenge_app/helpers/net_helper.dart';
import 'package:odyssey_challenge_app/my_app.dart';
import 'package:odyssey_challenge_app/repositories/document_repository.dart';
import 'package:odyssey_challenge_app/repositories/keys_repository.dart';
import 'package:odyssey_challenge_app/repositories/layout_repository.dart';
import 'package:odyssey_challenge_app/repositories/sdn_selected_repository.dart';
import 'package:odyssey_challenge_app/simple_bloc_observer.dart';
import 'package:commercio_ui/commercio_ui.dart';
import 'package:commerciosdk/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:print_lumberdash/print_lumberdash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  putLumberdashToWork(withClients: [PrintLumberdash()]);

  if (!kReleaseMode) {
    Bloc.observer = SimpleBlocObserver();
  }

  final commercioAccount = StatefulCommercioAccount(
    networkInfo: NetworkInfo(
      bech32Hrp: ChainNet.dev.bech32Hrp,
      lcdUrl: ChainNet.dev.lcdUrl,
    ),
    httpHelper: HttpHelper(
      faucetDomain: ChainNet.dev.faucetDomain,
      lcdUrl: ChainNet.dev.lcdUrl,
    ),
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: commercioAccount),
        RepositoryProvider(
          create: (_) =>
              StatefulCommercioDocs(commercioAccount: commercioAccount),
        ),
        RepositoryProvider(
          create: (_) =>
              StatefulCommercioId(commercioAccount: commercioAccount),
        ),
        RepositoryProvider(
          create: (_) =>
              StatefulCommercioMint(commercioAccount: commercioAccount),
        ),
        RepositoryProvider(
          create: (_) =>
              StatefulCommercioKyc(commercioAccount: commercioAccount),
        ),
        RepositoryProvider(create: (_) => DocumentRepository()),
        RepositoryProvider(create: (_) => SdnSelectedDataRepository()),
        RepositoryProvider(create: (_) => LayoutRepository()),
        RepositoryProvider(create: (_) => const KeysRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => ScaffoldNavigatorCubit()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
